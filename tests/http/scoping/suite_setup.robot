*** Settings ***

Resource        ../variables.robot
Library         HttpLibrary.HTTP
Suite Setup     Create HTTP Context   ${HOST}

*** Test Cases ***

Execute Request
    [Documentation]  The HTTP context for this test is set in the Suite Setup
    ...              above. Tests whether the state is correctly held in the
    ...              library.

    GET           /200

