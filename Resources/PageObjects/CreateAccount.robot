*** Settings ***
Library        SeleniumLibrary
Library        FakerLibrary

Resource    ../PageObjects/Password.robot

*** Variables ***
${NEW_USER_EMAIL_FIELD}                 email
${NEW_USER_PASSWORD_FIELD}              password
${NEW_USER_CONFIRM_PASSWORD_FIELD}      confirm
${INCORRECT_EMAIL_MESSAGE}    Email is incorrect!
${SIGN_UP_BUTTON}             xpath=//*[@id="root"]/div/div/div[4]/form/div/a
${SIGN_IN_BUTTON}             xpath=//*[@href='/sign-in']
${SUBMIT_BUTTON}              xpath=//button[@type='submit' and contains(text(),'Далее')]

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains Element    ${NEW_USER_CONFIRM_PASSWORD_FIELD}

Fill "Email" Field
    [Arguments]    ${Email}
    Click Element   ${NEW_USER_EMAIL_FIELD}
    Input Text  ${NEW_USER_EMAIL_FIELD}  ${Email}
    Element Should Be Disabled   ${SUBMIT_BUTTON}

Fill "Password" Field
    [Arguments]    ${Password}
    Click Element   ${NEW_USER_PASSWORD_FIELD}
    Input Text  ${NEW_USER_PASSWORD_FIELD}  ${Password}
    Element Should Be Disabled   ${SUBMIT_BUTTON}

Fill "Confirm" Field
    [Arguments]    ${Password}
    Click Element   ${NEW_USER_CONFIRM_PASSWORD_FIELD}
    Input Text  ${NEW_USER_CONFIRM_PASSWORD_FIELD}  ${Password}
    Element Should Be Enabled   ${SUBMIT_BUTTON}

Click "Sign In" Button
    Click Button    ${SIGN_IN_BUTTON}

Click "Submit" Button
    Click Button    ${SUBMIT_BUTTON}