*** Settings ***
Library        SeleniumLibrary
Resource    ../Resources/PageObjects/SignIn.robot
Resource    ../Resources/PageObjects/Password.robot
Resource    ../Resources/PageObjects/Home.robot
Resource    ../Resources/PageObjects/CreateAccount.robot

*** Variables ***

*** Keywords ***
Open Sign In Page
    SignIn.Navigate To
    SignIn.Verify Page Loaded

Log In With Valid Credentials
    [Arguments]    ${Email}     ${Password}
    SignIn.Enter Email And Proceed    ${Email}
    Password.Verify Page Loaded
    Password.Enter Password And Proceed    ${Password}
    sleep    2s
    Home.Verify Page Loaded

Log In With Invalid Credentials
    [Arguments]    ${Email}     ${Password}
    SignIn.Enter Email And Proceed    ${Email}
    Password.Verify Page Loaded
    Password.Enter Password And Proceed    ${Password}
    Password.Verify Login Error Message Displayed

Do Not Enter Email
    SignIn.Verify "Proceed" Button Is Disabled

Do Not Enter Password
    [Arguments]    ${Email}
    SignIn.Enter Email And Proceed    ${Email}
    Password.Verify Page Loaded
    Password.Verify "Submit" Button Is Disabled

Email Has Invalid Format
    [Arguments]    ${Email}
    Fill "Email" Field    ${Email}
    SignIn.Verify Invalid Email Format Message Displayed

Create New Account
    [Arguments]    ${Email}     ${Password}
    SignIn.Click "Sign Up" Button
    CreateAccount.Verify Page Loaded
    CreateAccount.Fill "Email" Field    ${Email}
    CreateAccount.Fill "Password" Field    ${Password}
    CreateAccount.Fill "Confirm" Field    ${Password}
    CreateAccount.Click "Submit" Button
    #проверять, что страница загружена по другому идентификатору
    #SignIn.Verify Page Loaded
#
Follow "Create New Account" Link And Sign In With Existing Credentials
    [Arguments]    ${Email}     ${Password}
    SignIn.Click "Sign Up" Button
    CreateAccount.Verify Page Loaded
    CreateAccount.Click "Sign In" Button
    SignIn.Enter Email And Proceed    ${Email}
    Password.Verify Page Loaded
    Password.Enter Password And Proceed    ${Password}
    sleep    2s
    Home.Verify Page Loaded
