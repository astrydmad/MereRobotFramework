*** Settings ***
Library        SeleniumLibrary
Resource    ../PageObjects/Password.robot

*** Variables ***
${EMAIL_FIELD}                          email
${PROCEED_BUTTON}                       //button[@type='button' and contains(text(),'Далее')]
${INCORRECT_EMAIL_MESSAGE}              Email is incorrect!

*** Keywords ***
Navigate To
    Go To                               ${START_URL}

Verify Page Loaded
    Wait Until Page Contains Element    ${EMAIL_FIELD}

Enter Email And Proceed
    [Arguments]    ${Email}
    Fill "Email" Field  ${Email}
    Verify "Proceed" Button Is Enabled
    Click "Proceed" Button

Fill "Email" Field
    [Arguments]    ${Email}
    Input Text  ${EMAIL_FIELD}  ${EMAIL}

Verify "Proceed" Button Is Enabled
    Element Should Be Enabled   ${PROCEED_BUTTON}

Verify "Proceed" Button Is Disabled
    Element Should Be Disabled   ${PROCEED_BUTTON}

Click "Proceed" Button
    Click Button    ${PROCEED_BUTTON}

Verify Invalid Email Format Message Displayed
    Page Should Contain     ${INCORRECT_EMAIL_MESSAGE}

