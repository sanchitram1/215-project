# run like
# ❯ uv run main.py -p user_password
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
    Returns the figure object instead of displaying it.
    """
    print(f"\n--- VISUALIZATION: {title} ---")

    # 1. Read the SQL file
    if not os.path.exists(sql_file):
        print(f"Error: File {sql_file} not found.")
        return None

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
                template="plotly",
            )
        elif chart_type == "pie":
            fig = px.pie(
                df,
                names=df.columns[0],
                values=df.columns[1],
                title=title,
                template="plotly",
            )
        elif chart_type == "donut":
            fig = px.pie(
                df,
                names=df.columns[0],
                values=df.columns[1],
                title=title,
                hole=0.4,
                template="plotly",
            )

        # Set smaller height for printing (fits on one page)
        fig.update_layout(height=300, margin=dict(l=20, r=20, t=50, b=20))

        print("   > Plot generated successfully.")
        return fig

    except Exception as e:
        print(f"Error generating visualization: {e}")
        return None


def create_dashboard(figures, output_file="dashboard.html"):
    """
    Combines multiple Plotly figures into a single HTML dashboard page.
    """
    if not figures or all(f is None for f in figures):
        print("Error: No valid figures to combine.")
        return

    # Create HTML content with all charts
    html_content = """
<!DOCTYPE html>
<html>
<head>
    <title>Database Visualization Dashboard</title>
    <script src="https://cdn.plot.ly/plotly-3.3.0.min.js"></script>
    <style>
        @media print {
            body {
                margin: 0;
                padding: 10px;
            }
            .chart-container {
                page-break-inside: avoid;
                margin-bottom: 15px;
            }
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
            color: #000000;
            margin: 0;
            padding: 20px;
        }
        .chart-container {
            margin-bottom: 20px;
            background-color: #ffffff;
            padding: 10px;
            border: 1px solid #e0e0e0;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #000000;
        }
        .plotly-graph-div {
            height: 300px !important;
        }
    </style>
</head>
<body>
    <h1>Database Visualization Dashboard</h1>
"""

    # Add each figure's HTML (extract just the div content)
    for i, fig in enumerate(figures):
        if fig is not None:
            html_content += '<div class="chart-container">\n'
            # Use full_html=False to get just the div, not a full HTML document
            chart_html = fig.to_html(
                include_plotlyjs=False, full_html=False, div_id=f"chart-{i}"
            )
            html_content += chart_html
            html_content += "</div>\n"

    html_content += """
</body>
</html>
"""

    # Write to file
    with open(output_file, "w") as f:
        f.write(html_content)

    print(f"\n✅ Dashboard saved to: {output_file}")
    print(f"   Open {output_file} in your browser to view all charts.")


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
        figures = []

        fig1 = run_visualization(
            conn,
            "sql/part_labor.sql",
            "Top 10 Parts by Labor Intensity",
            chart_type="bar",
        )
        if fig1:
            figures.append(fig1)

        fig2 = run_visualization(
            conn,
            "sql/customer_revenue.sql",
            "Top Customers by Revenue",
            chart_type="pie",
        )
        if fig2:
            figures.append(fig2)

        fig3 = run_visualization(
            conn,
            "sql/order_status.sql",
            "Current Order Status Distribution",
            chart_type="donut",
        )
        if fig3:
            figures.append(fig3)

        # 3. Combine all charts into a single dashboard
        if figures:
            create_dashboard(figures)

        conn.close()
        print("\n--- End of Analysis ---")


if __name__ == "__main__":
    main()
