*** Settings ***

Library         HttpLibrary.HTTP
Library         Process
Library         OperatingSystem

Resource        variables.robot

Suite Setup     Start Mockserver
Suite Teardown  Stop Mockserver

*** Keywords ***

Start Mockserver
    Start Process   tests/http/mockserver.py  ${PORT}
    Sleep           1

Stop Mockserver
    POST            http://${HOST}/kill
    Sleep           1
