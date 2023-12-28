*** Settings ***

Documentation    Test to Validate the Login form.
...
...

Library    SeleniumLibrary
Library    Collections

#Test Teardown    Close Browser Session


Resource    resource.robot

Test Setup    Open the browser with the Payment URL

*** Variables ***
${error_msg}    xpath://*[contains(@class,'alert')]

*** Test Cases ***
#Validate UnSuccessful Login
#
#    Fill the Login form    ${user_name}    ${invalid_password}
#    wait until it checks and displays the error Message    ${errormsg}
#    verify error message is correct

#Validate Successful Login and validate the card details
#
#    Fill the Login form     ${user_name}    ${valid_password}
#    wait until it checks and displays the error Message    ${checkoutbox}
#    Verify the cart details with the expected Items
#    Select the Cart     Blackberry

Fill the username and password and select the admin user
    Fill the details and select the normal user
*** Keywords ***

Fill the Login form


    [Arguments]    ${username}    ${password}
    Input Text    xpath://*[contains(@name,'username')]    ${username}
    Input Password    xpath://*[contains(@name,'password')]    ${password}
    Click Button    xpath://*[contains(@name,'signin')]

wait until it checks and displays the error Message
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}    timeout=10s

verify error message is correct

    ${result}=  Get Text    ${error_msg}
    Element Text Should Be    ${error_msg}    Incorrect username/password.

Verify the cart details with the expected Items
     ${expectedList}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
     Scroll Element Into View    xpath://button[@class='btn btn-info']
     ${actualList} =    Create List


    @{elements} =    Get WebElements    xpath://h4[@class='card-title']//a
    FOR    ${element}    IN    @{elements}
        ${element_text} =    Get Text    ${element}
        Log    ${element_text}
        Append To List    ${actualList}    ${element_text}

    END

    Lists Should Be Equal    ${expectedList}    ${actualList}
Select the Cart
    [Arguments]    ${cartname}
    ${elements}=    Get Webelements    xpath://h4[@class='card-title']//a
    ${index}=    Set Variable    1

    FOR    ${element}    IN    @{elements}
        ${element_text} =    Get Text    ${element}
        Log    ${element_text}
        Exit For Loop If    '${cartname}' == '${element_text}'
#        Append To List    ${actualList}    ${element_text}
        ${index}=    Evaluate    ${index}+1

    END

    Click Button    xpath:(//button[@class='btn btn-info'])[${index}]

Fill the details and select the normal user
    Input Text    xpath://input[@name='username']    rahulshettyacademy
    Input Password    xpath://input[@name='password']    learning
    Click Element    xpath://input[@value='user']/parent::label//span[@class='checkmark']
    Wait Until Element Is Visible    css:.modal-body    timeout=10s
    Click Button        id:okayBtn
    Click Button        id:okayBtn
    Wait Until Element Is Not Visible    css:.modal-body    timeout=30s
    Select From List By Value    css:select.form-control    teach
    Select Checkbox    terms
    Checkbox Should Be Selected    xpath://input[@id='terms']
