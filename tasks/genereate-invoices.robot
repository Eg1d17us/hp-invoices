*** Settings ***
Library     RPA.Browser.Selenium
Resource    ../Pages/hp-invoices-page.robot

*** Tasks ***
Generate invoices
    Fill and save invoice
    