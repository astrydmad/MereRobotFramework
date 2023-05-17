*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${PROFILE_ICON}     //div[contains(@class,'iconProfile')]
${MY_PROJECTS}      Мои проекты

*** Keywords ***
Verify Page Loaded
#    Wait Until Page Contains Element    ${MY_PROJECTS}
    Page Should Contain     ${MY_PROJECTS}