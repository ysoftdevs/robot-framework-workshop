*** Settings ***
Library           Selenium2Library

*** Keywords ***
Test init
    Open Browser    http://10.0.13.69:8080    firefox
    Maximize Browser Window

Test teardown
    Close Browser

Prepare data
    ${r1} =    Evaluate    random.randint(1000, 999999)    random,sys
    ${r2} =    Evaluate    random.randint(1000, 999999)    random,sys
    Set Test Variable    ${userId}    ${r1}
    Set Test Variable    ${testerName}    tester-${r2}
