*** Settings ***
Documentation     Template robot main suite.
Library    RPA.Excel.Files
Library    RPA.Tables
Library    RPA.Browser.Selenium
Library    RPA.Dialogs

*** Tasks ***
Everything
    Open Workbook    C:/Users/FOTV/OneDrive - GFT Technologies SE/Documents/rpachallenge_robocorp/challenge.xlsx
    @{data}=     Read Worksheet As Table    header=True
    Close Workbook
    Open Chrome Browser    http://rpachallenge.com
    Click Button    Start
    FOR    ${row}    IN    @{data}
        Input Text    xpath://input[@ng-reflect-name="labelFirstName"]    ${row}[First Name]
        Input Text    css:input[ng-reflect-name="labelLastName"]          ${row}[Last Name]
        Input Text    css:input[ng-reflect-name="labelPhone"]             ${row}[Phone Number]
        Input Text    css:input[ng-reflect-name="labelEmail"]             ${row}[Email]
        Input Text    css:input[ng-reflect-name="labelAddress"]           ${row}[Address]
        Input Text    css:input[ng-reflect-name="labelCompanyName"]       ${row}[Company Name]
        Input Text    css:input[ng-reflect-name="labelRole"]              ${row}[Role in Company]
        Click Button    css:input[value="Submit"]
    END
    Dialog

*** Keywords ***
Dialog as progress indicator
    Add heading    Stop
    ${dialog}=     Show dialog    title=Stop    on_top=${TRUE}
    Close dialog   ${dialog}
