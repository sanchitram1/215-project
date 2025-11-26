# Database Implementation

Implement an MRO database for an airline parts maintenance company.

## Visualization Tool

This project includes a visualization tool that generates interactive charts from database queries.

### How to Run

The script requires a database password as a command-line argument:

```bash
# Using uv (recommended)
uv run main.py -p YOUR_PASSWORD

# Or using python directly
python main.py -p YOUR_PASSWORD
```

You can also use the long form:
```bash
uv run main.py --password YOUR_PASSWORD
```

**Note:** The password is required. If not provided, the script will exit with an error message.

### Output

The script performs the following:

1. **Security Verification**: Tests that the guest database user has read-only permissions (attempts a destructive operation that should fail)

2. **Data Visualization**: Executes three SQL queries from the `sql/` directory:
   - `sql/part_labor.sql` - Top 10 Parts by Labor Intensity (bar chart)
   - `sql/customer_revenue.sql` - Top Customers by Revenue (pie chart)
   - `sql/order_status.sql` - Current Order Status Distribution (donut chart)

3. **Dashboard Generation**: Combines all three visualizations into a single HTML file named `dashboard.html`

### Viewing the Output

After the script completes, open `dashboard.html` in any web browser:

```bash
# On macOS
open dashboard.html

# On Linux
xdg-open dashboard.html

# Or simply double-click the file in your file manager
```

The dashboard displays all three charts on a single page with:
- White background and black text (optimized for printing)
- Compact chart sizes (300px height) to fit on one page
- Interactive Plotly charts that can be zoomed and explored

You can print the dashboard directly from your browser (File → Print) and it will render with proper formatting for a single page.