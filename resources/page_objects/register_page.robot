***Settings***
Documentation    Keywords for the register page
Library           SeleniumLibrary
Library    FakerLibrary
Library           String
Library    DateTime
Library    Collections  # Required for list operations
Library    BuiltIn

***Variables***
${FIRST_NAME_LOCATOR}   id=first_name
${LAST_NAME_LOCATOR}    xpath=//input[@id='last_name']
${DOB_LOCATOR}  xpath=//input[@id='dob']
${STREET_LOCATOR}   xpath=//input[@id='street']
${CITY_LOCATOR}       xpath=//input[@id='city']
${STATE_LOCATOR}      xpath=//input[@id='state']
${POSTAL_CODE_LOCATOR}  xpath=//input[@id='postal_code']
${COUNTRY_LOCATOR}    xpath=//select[@id='country']
${PHONE_LOCATOR}      xpath=//input[@id='phone']
${EMAIL_INPUT_LOCATOR}       id=email
${PASSWORD_INPUT_LOCATOR}    id=password
${REGISTER_BUTTON_LOCATOR}    xpath=//button[normalize-space()='Register']


***Keywords***
Enter Registration Details
    [Arguments]    ${first_name}    ${last_name}    ${dob}    ${street}
    ...    ${city}    ${state}    ${postal_code}    ${country}
    ...    ${phone}    ${email}    ${password}
    Input Text    ${FIRST_NAME_LOCATOR}    ${first_name}
    Input Text    ${LAST_NAME_LOCATOR}     ${last_name}
    Input Text    ${DOB_LOCATOR}           ${dob}
    Input Text    ${STREET_LOCATOR}        ${street}
    Input Text    ${CITY_LOCATOR}          ${city}
    Input Text    ${STATE_LOCATOR}         ${state}
    Input Text    ${POSTAL_CODE_LOCATOR}     ${postal_code}
    Select From List By Value    ${COUNTRY_LOCATOR}       ${country}
    Input Text    ${PHONE_LOCATOR}         ${phone}
    Input Text    ${EMAIL_INPUT_LOCATOR}       ${email}
    Input Text    ${PASSWORD_INPUT_LOCATOR}    ${password}

Register User With AI Data
    ${first_name}=       FakerLibrary.First Name
    ${last_name}=        FakerLibrary.Last Name
    ${dob}=    Generate ValidDate
    ${street}=           FakerLibrary.Street Address
    ${city}=             FakerLibrary.City
    ${state}=            FakerLibrary.State
    ${postal_code}=      FakerLibrary.Postcode
    ${country}=          Evaluate    random.choice(['US', 'CA', 'GB', 'AU', 'MM'])    random
    ${phone}=            Numerify    ##########
    ${email}=            FakerLibrary.Email
    ${password}=         FakerLibrary.Password

    Log To Console    First Name: ${first_name}
    Log To Console    Last Name: ${last_name}


    Enter Registration Details    ${first_name}    ${last_name}    ${dob}    ${street}
    ...    ${city}    ${state}    ${postal_code}    ${country}
    ...    ${phone}    ${email}    ${password}


    Log    REGISTERED_USERS before append: ${REGISTERED_USERS}
    Log    Type of REGISTERED_USERSR: ${REGISTERED_USERS.__class__}
    Append To List    ${REGISTERED_USERS}    ${email}    ${password}    # Store credentials
    ${list_length}=    Get Length    ${REGISTERED_USERS}
    Log    List lengthR: ${list_length}
    Log    Type of REGISTERED_USERSR: ${REGISTERED_USERS.__class__}
    Click Register Button

Register Multiple Users With AI Data
    [Arguments]    ${count}
    ${REGISTERED_USERS}=    Create List
    Set Global Variable    ${REGISTERED_USERS}
    Go To Page    auth/login
    Go To New Register Page
    FOR    ${index}    IN RANGE    ${count}
        Register User With AI Data
        Verify Successful Registration  #  Add this to check Success
        Run Keyword Unless    ${index} == ${count} - 1    Go To New Register Page
    END

Attempt Login with Stored Credentials
    ${list_length}=    Get Length    ${REGISTERED_USERS}
    Log    List length: ${list_length}
    Log    Type of REGISTERED_USERS: ${REGISTERED_USERS.__class__}

    FOR    ${index}    IN RANGE    0    ${list_length}    2
        ${login_email}=    Get From List    ${REGISTERED_USERS}    ${index}
        ${login_password}=    Get From List    ${REGISTERED_USERS}    ${index+1}

        Log    Attempting to log in with: ${login_email} / ${login_password}

        Go To Page    auth/login
        Enter Email    ${login_email}
        Enter Password    ${login_password}
        Click SignInButton
    END




Go To RegisterPage
    Go To Page    /auth/register/

Enter FirstName
    [Arguments]    ${first_name}
    Input Text    ${FIRST_NAME_LOCATOR}    ${first_name}

Enter Last Name
    [Arguments]    ${last_name}
    Input Text  ${LAST_NAME_LOCATOR}    ${last_name}

Enter DOB
    [Arguments]    ${dob}
    Input Text    ${DOB_LOCATOR}    ${dob}

Enter Street
    [Arguments]    ${street}
    Input Text    ${STREET_LOCATOR}    ${street}

Enter City
    [Arguments]    ${city}
    Input Text    ${CITY_LOCATOR}    ${city}

Enter State
    [Arguments]    ${state}
    Input Text    ${STATE_LOCATOR}    ${state}

Enter Postal Code
    [Arguments]    ${postal_code}
    Input Text    ${POSTAL_CODE_LOCATOR}    ${postal_code}

Select Country
    [Arguments]    ${country}
    Select From List By Value    ${COUNTRY_LOCATOR}    ${country}

Enter Phone
    [Arguments]    ${phone}
    Input Text    ${PHONE_LOCATOR}    ${phone}

Enter Register Email
    [Arguments]    ${email}
    Input Text    ${EMAIL_INPUT_LOCATOR}    ${email}

Enter Register Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_INPUT_LOCATOR}    ${password}

Click RegisterButton
    Click Element    ${ReGISTER_BUTTON_LOCATOR}
    Log To Console    Clicked the register button successfully
    Wait Until Element Is Not Visible    //h3[normalize-space()='Customer registration']  15s

Verify Successful Registration
    ${url}=    Get Location
    Log To Console    Current URL: ${url}
    Should Be Equal As Strings    ${url}    https://practicesoftwaretesting.com/auth/login

Generate ValidDate

    ${name}=    FakerLibrary.First Name
    ${start_date}=    Evaluate    datetime.date(1960, 1, 1)    modules=datetime
    ${end_date}=    Evaluate    datetime.date(2003, 12, 31)    modules=datetime
    ${dob}=    FakerLibrary.Date Between    start_date=${start_date}    end_date=${end_date}
    ${dob_formatted}=    Convert Date    ${dob}    result_format=%m/%d/%Y
    [Return]    ${dob_formatted}
