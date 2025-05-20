***Settings***
Documentation    Tests for user login functionality
Resource         ../resources/common.robot
Resource         ../resources/page_objects/home_page.robot
Resource         ../resources/page_objects/login_page.robot
Suite Setup      Open Browser To Home Page
#Suite Teardown   Close Browser

***Test Cases***
Login with Valid Credentials
    [Tags]             end_to_end
    Go To Sign In Page
    #Go To LoginPage
    Enter Email    htethtet4@gmail.com
    Enter Password    Hhw88888888*
    Click SignInButton
    # Add keywords to verify successful login, e.g., check for a welcome message

    #Click SignOut

Login with Invalid Password
    Go To Home Page
    Go To Sign In Page
    Enter Email    test@test.com
    Enter Password    wrongpassword
    Click SignInButton
    # Add keywords to verify error message.  The error message locator may need further refinement.
    Element Should Be Visible    xpath=//div[@class='alert alert-danger']