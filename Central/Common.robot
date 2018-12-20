*** Settings ***
Library  SeleniumLibrary


*** Variables ***



*** Keywords ***

Begin Web Test
    Open Browser  about:blank  ${BROWSER}

End Web Test
    Close Browser