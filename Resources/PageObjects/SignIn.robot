*** Settings ***
Library        SeleniumLibrary
Library        FakerLibrary

Resource    ../PageObjects/Password.robot

*** Variables ***
${EMAIL_FIELD}                email
${PROCEED_BUTTON}             //button[@type='button' and contains(text(),'Далее')]
${INCORRECT_EMAIL_MESSAGE}    Email is incorrect!
${SIGN_UP_BUTTON}             xpath=//*[@id="root"]/div/div/div[4]/form/div/a
${GOOGLE_BUTTON}              xpath=//*[@id="root"]/div/div/div[2]/div/div/div/div/div[2]/span[1]

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

Click "Sign Up" Button
    Click Element    ${SIGN_UP_BUTTON}

Click "Contunue With Google" button
    Click Element       ${GOOGLE_BUTTON}

