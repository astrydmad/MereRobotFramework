*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${PASWORD_FIELD}                      password
${SUBMIT_BUTTON}                      //button[@type='submit' and contains(text(),'Далее')]
${INVALID_CREDENTIALS_MESSAGE}        No active account found with the given credentials

*** Keywords ***

Enter Password And Proceed
    [Arguments]    ${Password}
    Verify Page Loaded
    Fill "Password" Field   ${Password}
    Verify "Submit" Button Is Enabled
    Click "Submit" Button

Verify Page Loaded
    Wait Until Page Contains Element    ${PASWORD_FIELD}

Fill "Password" Field
    [Arguments]    ${Password}
    Input Text  ${PASWORD_FIELD}   ${Password}

Verify "Submit" Button Is Enabled
    Element Should Be Enabled   ${SUBMIT_BUTTON}

Verify "Submit" Button Is Disabled
    Element Should Be Disabled   ${SUBMIT_BUTTON}

Click "Submit" Button
    Click Button    ${SUBMIT_BUTTON}

Verify Login Error Message Displayed
    Page Should Contain     ${INVALID_CREDENTIALS_MESSAGE}
