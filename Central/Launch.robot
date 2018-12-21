*** Settings ***
Documentation  Kickbotz Execution

Resource   ${EXECDIR}/Central/Common.robot
Resource   ${EXECDIR}/Central/4didas.robot


Test Setup  Begin Web Test
Test Teardown  End Web Test


*** Variables ***

${BROWSER}   headlessfirefox




*** Test Cases ***
Boost
    Log To Console  Boost Order
    4didas.MensWorkflow