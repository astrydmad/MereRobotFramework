*** Settings ***
Library        SeleniumLibrary
Resource    ../Resources/PageObjects/SignIn.robot
Resource    ../Resources/PageObjects/Password.robot
Resource    ../Resources/PageObjects/Home.robot

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
    Home.Verify Page Loaded
#    LogInPage.Enter Valid Email
#    LogInPage.Verify Proceed Button Is Enabled
#    LogInPage.Click Proceed Button

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