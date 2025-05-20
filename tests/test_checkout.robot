***Settings***
Resource         ../resources/page_objects/checkout_page.robot

***Test Cases***

Verify Product Details on Checkout
    [Tags]             end_to_end

    Check Checkout Information    Pliers    4    $12.01    $48.04    $48.04
    Click Proceed To Checkout1
    Check SignIn Message    you are already logged in.
    Click Proceed To Checkout2
    Check Billing Address
    Click Proceed To Checkout3
    Check Payment Message   Payment
    Select Payment Method   Cash on Delivery
    Click Confirm
    Verify PaymentSuccess   Payment was successful



