***Settings***
Documentation    Keywords for the Categories page
Resource         ../common.robot

***Variables***
${PRODUCT_ITEM}    xpath=//span[@data-test='product-title']
${PRODUCT_QUANTITY}    xpath=//input[@data-test='product-quantity']
${PRODUCT_PRICE}    xpath=//span[@data-test='product-price']
${TOTAL_PRICE}    xpath=//span[@data-test='line-price']
${CART_TOTAL}    css=[data-test='cart-total']
${PROCEED_TO_CHECKOUT1}    xpath=//button[@data-test='proceed-1']
${PROCEED_TO_CHECKOUT2}    xpath=//button[@data-test='proceed-2']
${PROCEED_TO_CHECKOUT3}    xpath=//button[@data-test='proceed-3']
${BILLING_ADDRESS}    xpath=//h3[normalize-space()='Billing Address']
${SIGNIN_TEXT}    xpath=//p[@class='ng-star-inserted']
${PAYMENT_TEXT}    xpath=//h3[normalize-space()='Payment']
${PAYMENT_METHOD}    xpath=//select[@data-test="payment-method"]
${Finish_BUTTON}    xpath=//button[@data-test='finish']
${PAYMENT_SUCCESS}    xpath=//div[@data-test='payment-success-message']

***Keywords***
Check Checkout Information
    Wait Until Element IsVisible    ${PRODUCT_ITEM}    6s
    [Arguments]    ${expected_product_name}    ${expected_quantity}    ${expected_price}    ${expected_total_price}     ${expected_cart_total_price}
    ${product_item}=    Get Text    ${PRODUCT_ITEM}
    Should Be Equal As Strings  ${product_item.strip()}    ${expected_product_name.strip()}
    Log To Console   Product Name: ${product_item}

    Wait Until Element IsVisible    ${PRODUCT_QUANTITY}    5s
    ${actual_quantity}=    Get Element Attribute    ${PRODUCT_QUANTITY}    value
    Should Be Equal As Numbers    ${actual_quantity}    ${expected_quantity}

    ${actual_price}=    Get Text    ${PRODUCT_PRICE}
    Log To Console    Product Price: ${actual_price}
    Should Be Equal As Strings    ${actual_price}    ${expected_price}


    ${total}=    Get Text    ${TOTAL_PRICE}
    Log To Console    Total Price: ${total}
    Should Be Equal    ${total}    ${expected_total_price}

    ${cart_total}=    Get Text    ${CART_TOTAL}
    Log To Console    Cart Total: ${cart_total}
    Should Be Equal   ${cart_total}    ${expected_cart_total_price}

Click Proceed To Checkout1
    Click Element    ${PROCEED_TO_CHECKOUT1}
    Wait Until Element Is Visible    ${SIGNIN_TEXT}    5s

Check SignIn Message
    [Arguments]    ${expected_signin_msg}
    ${actual_signin_msg}=    Get Text    ${SIGNIN_TEXT}
    Log To Console    SignIn Message: ${actual_signin_msg}
    Should Contain    ${actual_signin_msg}    ${expected_signin_msg}

Click Proceed To Checkout2
    Click Element    ${PROCEED_TO_CHECKOUT2}
    Log To Console    Clicked Proceed To Checkout2 successfully
    Wait Until Element Is Visible    ${BILLING_ADDRESS}    6s

Check Billing Address
    Element Should Be Visible    ${BILLING_ADDRESS}

Click Proceed To Checkout3
    Click Element    ${PROCEED_TO_CHECKOUT3}
    Wait Until Element Is Visible    ${PAYMENT_TEXT}    5s

Check Payment Message
    [Arguments]    ${expected_payment_msg}
    ${actual_payment_msg}=    Get Text    ${PAYMENT_TEXT}
    Log To Console    Payment Message: ${actual_payment_msg}
    Should Contain    ${actual_payment_msg}    ${expected_payment_msg}

Select Payment Method
    [Arguments]    ${payment_label}
    Wait Until Element Is Visible    ${PAYMENT_METHOD}    5s
    ${items}=    Get List Items    ${PAYMENT_METHOD}
    Log To Console    ${items}
    Select From List By Label        ${PAYMENT_METHOD}    ${payment_label}

Click Confirm
    Click Element    ${Finish_BUTTON}
    Wait Until Element Is Visible    ${PAYMENT_SUCCESS}    5s

Verify PaymentSuccess
    [Arguments]    ${expected_payment_success_msg}
    ${actual_payment_success_msg}=    Get Text    ${PAYMENT_SUCCESS}
    Log To Console    Payment Success Message: ${actual_payment_success_msg}
    Should Contain    ${actual_payment_success_msg}    ${expected_payment_success_msg}