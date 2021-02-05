*** Settings ***

Resource        ../variables.robot
Library         HttpLibrary.HTTP

*** Keywords ***

Keyword Using HTTP
    Create HTTP Context

    Set Request Body                KEYWORD
    POST                            /echo
    Response Body Should Contain    KEYWORD

    Restore HTTP Context

*** Test Cases ***

Library State Should Be Restorable In Keywords
    Create HTTP Context             ${HOST}
    Set Request Body                TESTCASE

    Keyword Using HTTP

    # The following can only succeed if the keyword doesn't mess
    # with the internal httplib state and it's properly restored.

    POST                            /echo
    Response Body Should Contain    TESTCASE

