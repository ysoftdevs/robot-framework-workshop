*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Create customer
    Open Browser    http://10.0.13.69:8080    firefox
    Click Link    Payment System Administration
    Input Text    username    safeq
    Input Text    password    password
    Click Button    log-in
    Click Link    create-customer
    Input Text    guid    1
    Input Text    create-customer-name    Tester
    Input Text    create-customer-lookup-key    tester
    Input Text    create-customer-initial-balance    0
    Click Button    Create customer
    Close Browser

Create customer with verification
    Open Browser    http://10.0.13.69:8080    firefox
    Click Link    Payment System Administration
    Input Text    username    safeq
    Input Text    password    password
    Click Button    log-in
    Page Should Contain    YSoft Payment System (1.25.31), Copyright© 2000-2015
    Click Link    create-customer
    Input Text    guid    1
    Input Text    create-customer-name    Tester
    Input Text    create-customer-lookup-key    tester
    Input Text    create-customer-initial-balance    0
    Click Button    Create customer
    Page Should Contain    Customer has been created.
    Click Button    Log out
    Close Browser

Create unique customer with verification
    ${r1} =    Evaluate    random.randint(1000, 999999)    random,sys
    ${r2} =    Evaluate    random.randint(1000, 999999)    random,sys
    Open Browser    http://10.0.13.69:8080    firefox
    Maximize Browser Window
    Click Link    Payment System Administration
    Input Text    username    safeq
    Input Text    password    password
    Click Button    log-in
    Page Should Contain    YSoft Payment System (1.25.31), Copyright© 2000-2015
    Click Link    create-customer
    Input Text    guid    ${r1}
    Input Text    create-customer-name    Tester-${r2}
    Input Text    create-customer-lookup-key    tester-${r2}
    Input Text    create-customer-initial-balance    0
    Click Button    Create customer
    Page Should Contain    Customer has been created.
    Click Button    Log out
    Close Browser
