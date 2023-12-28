*** Settings ***
Documentation    To validate the child Window Traversal and grab the email
Library    SeleniumLibrary
Test Teardown    Close Browser
*** Variables ***

${childwindow}    xpath://a[@class='blinkingText']
${MAIN_WINDOW_HANDLE}   None
${NEW_WINDOW_HANDLE}    None
${email}    xpath://a[.='mentor@rahulshettyacademy.com']


*** Test Cases ***

To Validate the Child Window Traversal and Grab the text
    Open the Browser with the URL
    Click on the Link and go the Other window
    Grab the Text from the Child Window and fill the email id
#    Traverse back to the parent window and fill the email id field
*** Keywords ***
Open the Browser with the URL
    Open Browser    url=https://rahulshettyacademy.com/loginpagePractise/    browser=chrome    options=add_experimental_option("detach",${true})
    Maximize Browser Window


Click on the Link and go the Other window
    Click Element    ${childwindow}
    ${handles}=    Get Window Handles
    ${NEW_WINDOW_HANDLE}=    Set Variable    ${handles}[1]
    Switch Window    ${NEW_WINDOW_HANDLE}

Grab the Text from the Child Window and fill the email id
    ${emailText}=    Get Text    ${email}
    log    ${emailText}
    Sleep    3s
    Switch Window    MAIN
    Input Text    xpath://*[contains(@name,'username')]    ${emailText}

