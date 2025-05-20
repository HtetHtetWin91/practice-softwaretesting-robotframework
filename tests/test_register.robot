***Settings***
Documentation    Tests for new user register functionality
...              Registers multiple users using AI-generated data.
...              This test demonstrates data-driven testing with FakerLibrary.
Resource         ../resources/common.robot
Resource         ../resources/page_objects/home_page.robot
Resource         ../resources/page_objects/register_page.robot
Resource         ../resources/page_objects/login_page.robot
Suite Setup      Open Browser To Home Page
#Suite Teardown   Close Browser
Library    FakerLibrary
Library    DateTime


***Test Cases***
Register with Valid Credentials
    Go To Sign In Page
    Go To New Register Page
    Enter FirstName    Test
    Enter Last Name    Win
    Enter DOB           01-01-1991
    Enter Street        123 Main St
    Enter Postal Code   11111
    Enter City          Yangon
    Enter State         Yangon
    Select Country       MM
    Enter Phone         1234567890
    Enter Register Email     htethtet1@gmail.com
    Enter Register Password      Hhw88888888*
    Click RegisterButton
    Element Should Be Visible    xpath=//a[normalize-space()='Contact']

    # Add keywords to verify successful registration, e.g., check for a confirmation message
    Location Should Be    https://practicesoftwaretesting.com/auth/login


MultiUserRegisterAndLogInWithAIData
    [Tags]    AI_Data_Driven_Reg/Login
    Register Multiple Users With AI Data    3
    Attempt Login with Stored Credentials


SingleUserRegisterAndLogInWithAIData
    [Tags]    end_to_end
    Register Multiple Users With AI Data    1
    Attempt Login with Stored Credentials


