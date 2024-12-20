## PowerShell Scripting Problems

### 1. **File Search and Content Analysis**
   **Problem:** You need to search through hundreds of log files to find specific error messages, then compile a summary report of errors found.

   **Example Task:**
   - Recursively search for `.log` files within a directory.
   - Identify lines containing the keyword `"ERROR"`.
   - Output a summary report with the filename, line number, and error text.

---

### 2. **Bulk Renaming Files**
   **Problem:** You have a directory filled with images or documents that need to be renamed based on a specific pattern, such as adding a date stamp or replacing spaces with underscores.

   **Example Task:**
   - Rename all `.jpg` files by adding a timestamp to the filename.
   - Replace all spaces in filenames with underscores.
   - Ensure the operation doesn't overwrite existing files.

---

### 3. **Data Import and Export Automation**
   **Problem:** You need to automate the process of importing data from a `.csv` file, transforming it, and exporting it to another format, like `.xlsx`.

   **Example Task:**
   - Import a `.csv` file containing sales data.
   - Filter the data to include only rows where the sales exceed $500.
   - Export the filtered data to an Excel file.

---

### 4. **Web Scraping for Price Monitoring**
   **Problem:** You want to track the price of a product from a website and get an alert if the price drops below a certain threshold.

   **Example Task:**
   - Fetch the HTML of a product page.
   - Extract the current price using a regular expression or HTML parsing module.
   - Compare the price to a threshold and send an email notification if the price drops.

---

### 5. **Monitoring Folder Changes**
   **Problem:** You need to monitor a specific folder for changes (new, modified, or deleted files) and log those changes in real-time.

   **Example Task:**
   - Set up a watcher on a directory.
   - Log events when files are added, removed, or modified.
   - Generate a timestamped log entry for each change.
