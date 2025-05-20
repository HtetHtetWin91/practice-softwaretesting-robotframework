Summary of Project

Project: UI Test Automation for Practice Software Testing Website
URL: https://practicesoftwaretesting.com/
It includes test cases for user registration, login, product search, and checkout features
 — using **AI-generated user data**.


Robot Framework Project Setup Guide
1. Required Installations
    Python Installation
    Download Python 3.8+ from python.org

    PyCharm IDE (Recommended)
    Download PyCharm Community Edition from jetbrains.com
    Install PyCharm IDE

    How to open this project in PyCharm from Git repository
        Open the Pycharm IDE
        Click on File > Project From Version Control > Repository URL
        Fill up this repository URL -  https://github.com/HtetHtetWin91/practice-softwaretesting-robotframework.git
        Clone the repository

    ChromeDriver Setup
    Check your Chrome browser version (chrome://settings/help)
    Download matching ChromeDriver from https://chromedriver.chromium.org/downloads
    Setup ChromeDriver path in your system environment variables

2. Required Libraries
    Install pip install -r requirements.txt

3. Project Structure
      project/
    ├── resources/
    │   ├── libraries/               # Custom/Python libraries
    │   ├── page_objects/            # Page Object files
    │   │   ├── categories_page.robot
    │   │   ├── checkout_page.robot
    │   │   ├── home_page.robot
    │   │   ├── login_page.robot    │   │
    │   │   ├── register_page.robot
    │   │   ├── search_page.robot
    │   │   └── common.robot         # Shared keywords
    │   │
    │   └── images/                  # Visual reference files
    │       ├── buttonsearch.png
    │       ├── inputsearch.png
    │       └── result_search.png
    │
    ├── tests/
    │
    │   ├── FakerLibrary.html       # Test output files
    │   ├── log.html
    │   ├── output.html
    │   ├── output.xml
    │   └── report.html
    │   │
    │   ├── test_categories.robot
    │   ├── test_checkout.robot
    │   ├── test_login.robot
    │   ├── test_product_search.robot
    │   ├── test_register.robot
    │   └── toast_message.png        # Test evidence
    │
    ├── geckodriver-1.log            # Browser driver logs
    ├── main.py                      # Optional Python scripts
    ├── README.txt                   # Project documentation
    └── requirements.txt             # Dependencies

4. Running Tests - Step-by-step in PyCharm
    * Open Terminal
      In PyCharm, go to the bottom toolbar and click "Terminal".
    * Navigate to the tests folder
        Use the command:
        ```bash
        cd tests
        ```
    * Runs data-driven registration and login testing using AI-generated multi data with FakerLibrary.
        Use the command:
        ```bash
        robot -i AI_Data_Driven_Reg/Login test_register.robot
        ```
    * Runs end-to-end tests covering login, product search, and checkout.
        Use the command:
        ```bash
        robot -i end_to_end  test_register.robot  test_categories.robot  test_checkout.robot
        ```
    * Runs check_by_image test and capture the screenshot for toast message.
        Use the command:
        ```bash
        robot -i check_by_image test_product_search.robot
        ```
