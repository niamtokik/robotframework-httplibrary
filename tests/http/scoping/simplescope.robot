*** Settings ***

Resource        ../variables.robot
Library         HttpLibrary.HTTP
Suite Setup     Create HTTP Context    ${HOST}

*** Test Cases ***

Execute echo request
    Prepare echo request

    POST                          /echo

    Response Body Should Contain  simplescope

*** Keywords ***

Prepare echo request
    Set Request Body              simplescope
    Set Request Header            Content-Type    text/plain
