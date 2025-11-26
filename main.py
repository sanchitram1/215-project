# run like
# ❯ uv run main.py -p YetAnotherDatabasePassword513!
# OR
# python main.py -p YetAnotherDatabasePassword513!
import argparse
import os

import pandas as pd
import plotly.express as px
import psycopg2

DB_NAME = "postgres"
DB_USER = "guest"
DB_HOST = "34.53.51.97"
DB_PORT = "5432"


def get_db_connection(password):
    try:
        conn = psycopg2.connect(
            dbname=DB_NAME,
            user=DB_USER,
            password=password,
            host=DB_HOST,
            port=DB_PORT,
            sslmode="require",
        )
        return conn
    except psycopg2.Error as e:
        print(f"Unable to connect to the database: {e}")
        return None


def verify_security(conn):
    """
    Attempts to perform a destructive operation to verify guest permissions.
    """
    print("\n--- SECURITY CHECK: Attempting Destructive Action ---")
    cur = conn.cursor()

    # We attempt to DROP the 'orders' table.
    # If the Guest permissions are set correctly (SELECT ONLY), this MUST fail.
    destructive_query = "DROP TABLE orders CASCADE;"

    print(f"Executing: {destructive_query}")

    try:
        cur.execute(destructive_query)
        conn.commit()
        print("❌ CRITICAL FAILURE: The table was deleted! Permissions are too loose.")
    except psycopg2.Error as e:
        print("✅ SUCCESS: The database rejected the delete request.")
        print(f"   Reason: {e.pgerror.strip()}")
        conn.rollback()  # Reset the transaction so we can continue


def run_visualization(conn, sql_file, title, chart_type="bar"):
    """
    Reads SQL from a file, executes it, and generates a Plotly chart.
    """
    print(f"\n--- VISUALIZATION: {title} ---")

    # 1. Read the SQL file
    if not os.path.exists(sql_file):
        print(f"Error: File {sql_file} not found.")
        return

    with open(sql_file, "r") as f:
        query = f.read()

    # 2. Load data into Pandas
    try:
        # pandas can natively do it!
        df = pd.read_sql_query(query, conn)
        print(f"Data retrieved: {len(df)} rows.")

        # 3. Generate Plot
        if chart_type == "bar":
            fig = px.bar(
                df,
                x=df.columns[0],
                y=df.columns[1],
                title=title,
                color=df.columns[1],
                template="plotly_dark",
            )
        elif chart_type == "pie":
            fig = px.pie(
                df,
                names=df.columns[0],
                values=df.columns[1],
                title=title,
                template="plotly_dark",
            )
        elif chart_type == "donut":
            fig = px.pie(
                df,
                names=df.columns[0],
                values=df.columns[1],
                title=title,
                hole=0.4,
                template="plotly_dark",
            )

        # This will open the chart in your web browser
        fig.show()
        print("   > Plot generated successfully.")

    except Exception as e:
        print(f"Error generating visualization: {e}")


def main():
    parser = argparse.ArgumentParser(description="Database visualization tool")
    parser.add_argument(
        "--password",
        "-p",
        required=True,
        help="Database password (required)",
    )
    args = parser.parse_args()

    conn = get_db_connection(args.password)
    if conn:
        # 1. Verify that the Guest user cannot destroy data
        verify_security(conn)

        # 2. Run Visualizations from SQL files
        # note that these arguments need the sql files to be
        # inside a sql folder
        run_visualization(
            conn,
            "sql/part_labor.sql",
            "Top 10 Parts by Labor Intensity",
            chart_type="bar",
        )

        run_visualization(
            conn,
            "sql/customer_revenue.sql",
            "Top Customers by Revenue",
            chart_type="pie",
        )

        run_visualization(
            conn,
            "sql/order_status.sql",
            "Current Order Status Distribution",
            chart_type="donut",
        )

        conn.close()
        print("\n--- End of Analysis ---")


if __name__ == "__main__":
    main()
