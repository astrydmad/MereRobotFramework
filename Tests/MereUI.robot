*** Settings ***
Library        SeleniumLibrary

Resource    ../Resources/PageObjects/SignIn.robot
Resource    ../Resources/Common.robot
Resource    ../Resources/MereApp.robot

#run command
#robot -d results tests/MereUI.robot

Test Setup          Common.Begin Web Test
Test Teardown       Common.End Web Test

#Run script
#robot -d results tests/MereUi.robot

*** Variables ***
${BROWSER} =        chrome
${START_URL} =      https://builder.mereplatform.com/sign-in
@{EMAIL} =    greenrabbittest@gmail.com    invalid@gmail.com    invalidgmail.com    invalid@gmail
@{PASSWORD} =    1356TestPass!    invalidpassword

*** Test Cases ***

Open Sign In Page
    [Tags]    Smoke    SignIn
    MereApp.Open Sign In Page

Log In With Valid Credentials
    [Tags]    Smoke    SignIn
    MereApp.Open Sign In Page
    MereApp.Log In With Valid Credentials     ${EMAIL}[0]    ${PASSWORD}[0]

Log In With Invalid Email
    [Tags]    Negative    SignIn
    MereApp.Open Sign In Page
    MereApp.Log In With Invalid Credentials    ${EMAIL}[1]    ${PASSWORD}[0]

Log In With Invalid Password
    [Tags]    Negative    SignIn
    MereApp.Open Sign In Page
    MereApp.Log In With Invalid Credentials    ${EMAIL}[0]    ${PASSWORD}[1]

Log In With Invalid Email And Password
    [Tags]    Negative    SignIn
    MereApp.Open Sign In Page
    MereApp.Log In With Invalid Credentials    ${EMAIL}[1]    ${PASSWORD}[1]

Do Not Enter Email
    [Tags]    Negative    SignIn
    MereApp.Open Sign In Page
    MereApp.Do Not Enter Email

Do Not Enter Password
    [Tags]    Negative    SignIn
    MereApp.Open Sign In Page
    MereApp.Do Not Enter Password     ${EMAIL}[0]

Enter Email In Invalid Format
    [Tags]    Negative    SignIn
    MereApp.Open Sign In Page
    MereApp.Email Has Invalid Format    ${EMAIL}[2]
    SignIn.Verify "Proceed" Button Is Disabled
    MereApp.Email Has Invalid Format    ${EMAIL}[3]
    SignIn.Verify "Proceed" Button Is Disabled

Create New Account
    [Tags]    Smoke    CreateAccount
    ${NEW_USER}=    FakerLibrary.Email
    MereApp.Open Sign In Page
    MereApp.Create New Account    ${NEW_USER}    ${PASSWORD}[0]

Follow "Create New Account" Link And Sign In With Existing Credentials
    [Tags]    Functional    SignIn
    MereApp.Open Sign In Page
        MereApp.Follow "Create New Account" Link And Sign In With Existing Credentials   ${EMAIL}[0]    ${PASSWORD}[0]