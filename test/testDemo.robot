*** Settings ***
#documentation is simply used to give the purpose of why it is used and other information
Documentation    Test to Validate the Login form.
...
...
# Used to import the selenium library to perform the selenium operations . 
Library    SeleniumLibrary
# Closing the Browser

Test Teardown    Close Browser


*** Variables ***
#used to store the variables like xpath and css locators and other details
#These Variable are Global Variable 

${error_msg}    xpath://*[contains(@class,'alert')]



*** Test Cases ***
Validate UnSuccessful Login
#these are the Business Keywords not the selnium keywords .
#we need to wrap the business keyword with selenium keyword .
    Open the browser with the Payment URL
    Fill the Login form
    wait until it checks and displays the error Message
    verify error message is correct
# tying up the business keyword with the selenium keywords
*** Keywords ***
Open the browser with the Payment URL
#first in selenium we create a webdriver interface = new Chromedriver() thing you do na that one
#Documention URL : https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Create%20Webdriver
    Open Browser    url=https://rahulshettyacademy.com/loginpagePractise/    browser=chrome    options=add_experimental_option("detach",${true})
#    Create Webdriver  Chrome
    Maximize Browser Window
#    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the Login form
#Filling the Form Details 
    Input Text    xpath://*[contains(@name,'username')]    krishna
    Input Password    xpath://*[contains(@name,'password')]    sriram
    Click Button    xpath://*[contains(@name,'signin')]

wait until it checks and displays the error Message
    Wait Until Element Is Visible    ${error_msg}    timeout=10s

verify error message is correct
#Storing the returned Result in a String Variable .
    ${result}=  Get Text    ${error_msg}
#compare the two different Strings to see if the result is correct or not
    #Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${error_msg}    Incorrect username/password.