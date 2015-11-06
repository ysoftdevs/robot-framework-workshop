*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Find Petr Neugebauer on LinkedIN
    Open Browser    http://www.linkedin.cz/    firefox
    Maximize Browser Window
    Input Text    name=first    Petr
    Input Text    name=last    Neugebauer
    Click Element    name=search
    Click Link    Petr Neugebauer
    Page Should Contain    Testing is like sex. If it’s not fun, then you’re doing it wronk
    Sleep    3
    Capture Page Screenshot
    Close All Browsers
