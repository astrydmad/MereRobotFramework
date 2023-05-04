*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${PROFILE_ICON}     //div[contains(@class,'iconProfile')]

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains Element    ${PROFILE_ICON}