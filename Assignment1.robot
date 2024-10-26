*** Settings ***
Documentation    API Test GET Single User And POST Create User
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://reqres.in/
${USER_ID}     2
${ENDPOINT}    /api/users
*** Test Cases ***
Single User
   Create Session    Session    ${BASE_URL}    disable_warnings=1
   ${response}    GET On Session    Session    ${ENDPOINT}/${USER_ID}
   Status Should Be    200
   Log    ${response.content}

Create User
    Create Session    MySession    ${BASE_URL}    disable_warnings=1
    ${body} =    Create Dictionary    name=Ujang    job=QA
    ${headers} =    Create Dictionary    Content-Type=application/json
    ${response} =    POST On Session    MySession    ${ENDPOINT}    json=${body}    headers=${headers}
    ${status_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    201