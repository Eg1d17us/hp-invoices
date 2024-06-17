*** Settings ***
Library         RPA.Tables
Library         RPA.Excel.Files

*** Variables ***
${data_dir}             ./Data/
${teplate_file_dir}     ./template/template.xlsx
${xlsx_files}           ./excel-files/


*** Keywords ***
Fill and save invoice
    ${data_table} =  Get data from Excel file
    FOR  ${row}  IN  @{data_table}
        Open Workbook    ${teplate_file_dir}
        Set Cell Value    5    B    ${row["Vardas, pavardė"]}
        Set Cell Value    3    C    ${row["Sąskaitos data"]}
        Set Cell Value    6    B    ${row["Address"]}
        Set Cell Value    10   B    ${row["Paslauga 1"]}
        Set Cell Value    10   E    ${row["Paslauga 1 kaina"]}
        Set Cell Value    11   B    ${row["Paslauga 2"]}
        Set Cell Value    11   E    ${row["Paslauga 2 kaina"]}
        Set Cell Value    12   B    ${row["Paslauga 3"]}
        Set Cell Value    12   E    ${row["Paslauga 3 kaina"]}
        Save Workbook  ${xlsx_files}${row["Vardas, pavardė"]}.xlsx
        Close Workbook
    END
Get data from Excel file
    Open Workbook    ${data_dir}hp-invoices-data.xlsx
    ${data} =  Read Worksheet As Table  header=True
    Close Workbook
    RETURN  ${data}
    