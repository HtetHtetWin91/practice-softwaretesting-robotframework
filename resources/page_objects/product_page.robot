***Settings***
Documentation    Keywords for the product page

***Variables***
${ADD_TO_CART_BUTTON}    //button[contains(text(),'Add to cart')]
${PRODUCT_NAME}          css=.product_title entry-title
${PRODUCT_PRICE}         css=.woocommerce-Price-amount

***Keywords***
Click Add To Cart
    Click Element    ${ADD_TO_CART_BUTTON}

Verify Product Name
    [Arguments]    ${expected_name}
    Element Text Should Be    ${PRODUCT_NAME}    ${expected_name}

Verify Product Price
    [Arguments]    ${expected_price}
    Element Text Should Be    ${PRODUCT_PRICE}    ${expected_price}