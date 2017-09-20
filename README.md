# WindowsLogExport
SQL Solution for exporting windows log to database table using SSIS, ETL, and SSRS Reporting

This project will use PowerShell to grab ERRORs and WARNINGs from your WINDOWS LOGS from multiple servers.
It will create a CSV file forr each log.
The SSIS ETL project will process these CSV files by extracting the data and inserting it into a SQL database.
The SSIS ETL project will move processed CSV files to an archive folder.
SQL Agent jobs are included for processing and cleaning up files.
The SSRS Proiject includes a report that allows you to filter the data and view accordingly.
