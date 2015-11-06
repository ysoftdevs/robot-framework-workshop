*** Settings ***
Resource          ../Resources/Selenium.robot
Library           RequestsLibrary
Library           urllib
Library           uuid
Library           json.JSONEncoder    ensure_ascii=False
Resource          ../Config.robot
Library           OperatingSystem

*** Test Cases ***
Create customer
    Prepare data
    ${auth}=    Create List    safeq    password
    Create Session    main_session    https://10.0.13.69:8443/payment-system/api/v2/    auth=${auth}
    ${data}    Create Dictionary    guid=${userId}    name=${testerName}    lookupKey=${testerName}    minimumBalance=0.00    state=ENABLED
    ${jsondata}=    json.JSONEncoder.Encode    ${data}
    ${headers}=    Create Dictionary    Content-Type=application/json;charset=UTF-8
    ${response}    Post    main_session    /customer    ${jsondata}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    201
    Delete All Sessions

Create customer with configuration file
    Prepare data
    ${auth}=    Create List    ${login}    ${password}
    Create Session    main_session    https://${ip_address}:${port}/payment-system/api/v2/    auth=${auth}
    ${data}    Create Dictionary    guid=${userId}    name=${testerName}    lookupKey=${testerName}    minimumBalance=0.00    state=ENABLED
    ${jsondata}=    json.JSONEncoder.Encode    ${data}
    ${headers}=    Create Dictionary    Content-Type=application/json;charset=UTF-8
    ${response}    Post    main_session    /customer    ${jsondata}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    201
    Delete All Sessions
