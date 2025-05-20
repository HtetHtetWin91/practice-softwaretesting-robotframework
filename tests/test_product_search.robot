***Settings***
Documentation    Tests for product search functionality

Resource         ../resources/common.robot
Resource         ../resources/page_objects/home_page.robot
Resource         ../resources/page_objects/search_page.robot
Suite Setup      Open Browser To Home Page
Suite Teardown   Run Keyword And Ignore Error    Close Browser

***Test Cases***

Search for a Product By Locator
    Enter Search Query    saw
    Click Search Button


Search for a product By Image and Visual Check
    [Tags]    check_by_image
    Enter Search Query By Image    saw
    Click Search Button
    Select Item
    AddToCart
    VerifySuccessAlertMessageByImage


