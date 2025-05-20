***Settings***
Documentation    Tests for categories functionality
Resource         ../resources/common.robot
Resource         ../resources/page_objects/categories_page.robot
#Suite Setup      Open Browser To Home Page
#Suite Teardown   Close Browser

***Test Cases***

Add Product to Cart With Valid Quantity
    [Tags]             end_to_end
    ClickOn Categories
    Go To Hand Tools Category
    Select Hand Tools Product
    Increase Product Quantity
    AddToCart
    Click CheckOut
    #Go To Page    checkout/