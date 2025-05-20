***Settings***
Documentation    Keywords for the login page

***Variables***
${EMAIL_INPUT}       id=email
${PASSWORD_INPUT}    id=password
${SIGN_IN_BUTTON}    xpath=//input[@value='Login']
${CONTACT_MENU_DROPDOWN}    xpath=//a[@id='menu']
${SIGN_OUT_BUTTON}    xpath=//a[normalize-space()='Sign out']
${NEW_REGISTER_LINK}    //a[normalize-space()='Register your account']
${CATEGORY_LOCATOR}    xpath=//a[normalize-space()='Categories']
${HAND_TOOLS_LINK}    xpath=//a[normalize-space()='Hand Tools']

***Keywords***
Go To LoginPage
    Go To Page    /auth/login/
    # wait for the element to be visible
    Wait Until Element Is Visible    ${EMAIL_INPUT}

Go To New Register Page
    Click Element   ${NEW_REGISTER_LINK}


Enter Email
    [Arguments]    ${email}
    Input Text    ${EMAIL_INPUT}    ${email}

Enter Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_INPUT}    ${password}

Click SignInButton
     Click Element    ${SIGN_IN_BUTTON}
     Log To Console    Clicked the sign in button successfully
     Wait Until Element Is Visible   xpath=//a[@data-test='nav-menu']      10s

Click SignOut
    Wait Until Element Is Visible    ${CONTACT_MENU_DROPDOWN}    10s
    Click Element    ${CONTACT_MENU_DROPDOWN}
    Wait Until Element Is Visible    ${SIGN_OUT_BUTTON}    5s
    Click Element    ${SIGN_OUT_BUTTON}
