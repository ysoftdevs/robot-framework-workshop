*** Settings ***
Suite Setup       Test init
Suite Teardown    Test teardown
Library           Selenium2Library
Resource          ../Resources/Selenium.robot

*** Test Cases ***
Create customer
    Prepare data
    Click Link    Payment System Administration
    Input Text    username    safeq
    Input Text    password    password
    Click Button    log-in
    Page Should Contain    YSoft Payment System (1.25.31), Copyright© 2000-2015
    Click Link    create-customer
    Input Text    guid    ${userId}
    Input Text    create-customer-name    ${testerName}
    Input Text    create-customer-lookup-key    ${testerName}
    Input Text    create-customer-initial-balance    0
    Click Button    Create customer
    Page Should Contain    Customer has been created.
    Click Button    Log out
