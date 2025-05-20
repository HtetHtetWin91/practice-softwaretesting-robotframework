***Settings***
Documentation    Keywords for the Categories page
Resource         ../common.robot

***Variables***
${HAND_TOOLS_LINK}    xpath=//a[normalize-space()='Hand Tools']
${SELECTED_HAND_TOOLS}    xpath=//h5[normalize-space()='Pliers']  # Updated locator for selected Hand Tools
${PRODUCT_DESCRIPTION}    xpath=//p[@id='description']   # Updated locator for product description
${INCREASE_QUANTITY_BUTTON}    id=btn-increase-quantity   # Updated locator for increase quantity button
${PRODUCT_NAME}    xpath=//h1[normalize-space()='Pliers']   # Updated locator for product name
${PRODUCT_PRICE}    xpath=//span[@aria-label='unit-price']   # Updated locator for product price
${ADD_TO_CART_BUTTON}    xpath=//button[@id='btn-add-to-cart']   # Updated locator for add to cart button



***Keywords***
Go To Hand Tools Category
    Wait Until Element Is Visible    ${HAND_TOOLS_LINK}    5s
    Click Element    ${HAND_TOOLS_LINK}

Select Hand Tools Product
    Wait Until Element Is Visible    ${SELECTED_HAND_TOOLS}    5s
    Click Element    ${SELECTED_HAND_TOOLS}

# Verify that the product description is visible
    Wait Until Element Is Visible    ${PRODUCT_DESCRIPTION}     5s

Increase Product Quantity
    Click Element Multiple Times   ${INCREASE_QUANTITY_BUTTON}    3
    ${QUANTITY_VALUE}=    Get Value    id=quantity-input
    ${QUANTITY_VALUE}=    Convert To Number    ${QUANTITY_VALUE}
    Should Be Equal As Numbers    ${QUANTITY_VALUE}    4

    Verify Element Text    ${PRODUCT_NAME}    Pliers
    Verify Element Text    ${PRODUCT_PRICE}    12.01

AddToCart
    Wait Until Element Is Visible    ${ADD_TO_CART_BUTTON}    5s
    Click Element    ${ADD_TO_CART_BUTTON}


Click CheckOut
    Wait Until Element Is Visible    xpath=//a[@aria-label='cart']    5s
    Click Element    xpath=//a[@aria-label='cart']
    Wait Until Location Contains    checkout    5s


