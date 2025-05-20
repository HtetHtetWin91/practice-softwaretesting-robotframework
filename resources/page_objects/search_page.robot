***Settings***
Documentation    Keywords for the Search page
Library    SeleniumLibrary
Library    ImageHorizonLibrary
Library    OperatingSystem

***Variables***

${HOME_PAGE_URL}    ${BASE_URL}
${SEARCH_INPUT}     xpath=//input[@data-test='search-query']
${SEARCH_BUTTON}    xpath=//button[@data-test='search-submit']
${SIGN_IN_LINK}     //a[contains(text(),'Sign in')] # Updated locator
${SEARCH_TITLE}    xpath=//h3[@data-test='search-caption']
${IMAGE_DIR}    ${CURDIR}/images/
${SELECTED_ITEM}    xpath=//h5[normalize-space()='Wood Saw']
${ADD_TO_CART_BUTTON}    xpath=//button[@id='btn-add-to-cart']


***Keywords***
Go To Home Page
    Go To    ${BASE_URL}
    Element Should Be Visible  ${SEARCH_INPUT}

Enter Search Query
    [Arguments]    ${query}
    Wait Until Element Is Visible    ${SEARCH_INPUT}   5s
    Input Text    ${SEARCH_INPUT}    ${query}

Enter Search Query By Image
    [Arguments]    ${my_search}
    # 1. SET REFERENCE FOLDER (CRITICAL)
    Set Reference Folder    ${IMAGE_DIR}

    # 2. SCROLL TO REVEAL SEARCH FIELD
    Scroll To Reveal Element    inputsearch.png

    # 3. INTERACT WITH IMAGE
    Wait For    inputsearch.png    timeout=6
    Input Text    ${SEARCH_INPUT}    ${my_search}

Scroll To Reveal Element
    [Arguments]    ${image_name}
    ${MAX_ATTEMPTS}=    Set Variable    3
    ${SCROLL_PIXELS}=    Set Variable    400

    FOR    ${attempt}    IN RANGE    ${MAX_ATTEMPTS}
        ${found}    Run Keyword And Return Status    Wait For    ${image_name}    timeout=3
        Return From Keyword If    ${found}
        Execute JavaScript    window.scrollBy(0, ${SCROLL_PIXELS})
        Sleep    1s  # Allow page to settle
    END
    Fail    Could not find ${image_name} after scrolling

Click Search Button
    Click Element    ${SEARCH_BUTTON}
    Wait Until Element Is Visible    ${SEARCH_TITLE}    10s

Select Item
    Click Element    ${SELECTED_ITEM}

AddToCart
    Wait Until Element Is Visible    ${ADD_TO_CART_BUTTON}    5s
    Click Element    ${ADD_TO_CART_BUTTON}

VerifySuccessAlertMessageByImage
    Set Reference Folder    ${IMAGE_DIR}
    Wait Until Element Is Visible    xpath=//div[@role='alert']    20s
    Capture Page Screenshot    toast_message.png

    #Text Should Be Visible    "Product Added To Shopping Cart."    timeout=10

    # ${extracted_text}=    Get Text    toast_message.png
    # Console To Log   Found text: ${extracted_text}
    # Should Contain    ${extracted_text}    Product Added To Shopping Cart.
