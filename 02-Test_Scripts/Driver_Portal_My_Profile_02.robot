*** Settings ***
Documentation   Driver_Portal_My_Profile_02
...             Purpose:    Update Driver address on My Profile page

Library     SeleniumLibrary

Resource       ../01-Test_Libraries/Keywords.resource
Variables      ../01-Test_Libraries/test_variables.py

*** Test Cases ***
Driver-Portal-My-Profile-02 1.1 - Open Driver Portal Page and Log In
    Open Driver Portal Page As User     ${LOGIN_URL}    ${OLI_USERNAME}    ${OLI_PASSWORD}
    Wait Until Page Contains    Charging & Payment History    timeout=60
    Sleep                               5s
    Capture Page Screenshot     Charging_And_Payment_History_02.png
    Resolve Marketing Preferences Popup     No
    Sleep                               10s
    Click Button    I Accept

Driver-Portal-My-Profile-02 1.2 - Navigate to My Profile
    Navigate to My Profile Driver Portal
    Wait Until Page Contains    Personal Details
    Capture Page Screenshot     My_Profile_02.png

Driver-Portal-My-Profile-02 1.3 - Update Driver Address
    Sleep       2s
    Update Address Driver Portal    ${DRIVER_ADDRESS}
    Sleep       2s
    Click Button    Save
    Wait Until Page Contains    Driver profile updated successfully
    Capture Page Screenshot     Updated_Address_02.png
    Close Browser