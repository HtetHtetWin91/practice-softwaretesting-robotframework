***Settings***
Documentation    Common settings and keywords for the e-commerce tests
Library          SeleniumLibrary
Library          String


***Variables***
${BASE_URL}    https://practicesoftwaretesting.com  # Updated base URL
${BROWSER}     Chrome
${DELAY}       2s
${CATEGORY_LOCATOR}     xpath=//a[normalize-space()='Categories']


***Keywords***
Open Browser To Home Page
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Close Browser
    Close Browser

Go To Page
    [Arguments]    ${page_path}
    Go To    ${BASE_URL}/${page_path}

ClickOn Categories
    Click Element   ${CATEGORY_LOCATOR}



Element Should Be Visible
    [Arguments]    ${locator}    ${timeout}=10s
    Wait Until Element Is Visible    ${locator}    ${timeout}

Element Should Be Enabled
    [Arguments]    ${locator}    ${timeout}=10s
    Wait Until Element Is Enabled    ${locator}    ${timeout}

Element Text Should Be
    [Arguments]    ${locator}    ${expected_text}    ${timeout}=10s
    Wait Until Element Contains    ${locator}    ${expected_text}    ${timeout}

Click Element Multiple Times
    [Arguments]    ${locator}    ${times}
    FOR    ${i}    IN RANGE    ${times}
        Click Element    ${locator}
    END

Verify Element Value
    [Arguments]  ${locator}  ${expected_value}
    ${element_value}=  Get Element Attribute  ${locator}  value
    Should Be Equal As Numbers  ${element_value}  ${expected_value}

Verify Element Text
    [Arguments]  ${locator}  ${expected_value}
    ${element_value}=  Get Text  ${locator}
    Should Be Equal  ${element_value}  ${expected_value}

