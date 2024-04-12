*** Settings ***
Documentation     A test suite for valid login.
...
...               Keywords are imported from the resource file
Resource          keywords.resource
Default Tags      positive
Suite Setup       Create Output Directory

*** Test Cases ***
Login User with Password
    Connect to Server
    Login User            ironman    1234567890
    Verify Valid Login    Tony Stark
    [Teardown]    Close Server Connection

Denied Login with Wrong Password
    [Tags]    negative
    Connect to Server
    Run Keyword And Expect Error    *Invalid Password    Login User    ironman    123
    Verify Unauthorised Access
    [Teardown]    Close Server Connection

*** Keywords ***
Create Output Directory
    Create Directory    output

Verify Valid Login
    [Arguments]    ${username}    ${expected_name}
    # Your verification steps here

Verify Unauthorised Access
    # Your verification steps here
