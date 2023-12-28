*** Settings ***
Documentation    this resource file consists of the commonly used keywords and other details
...
...
...

Library    SeleniumLibrary

*** Variables ***
${user_name}    rahulshettyacademy
${invalid_password}    sriram
${valid_password}    learning
${url}    https://rahulshettyacademy.com/loginpagePractise/
${checkoutbox}    (//*[contains(@class,'nav-link')])[3]


*** Keywords ***
Open the browser with the Payment URL
    Open Browser    url= ${url}   browser=chrome    options=add_experimental_option("detach",${true})
    Maximize Browser Window
Close Browser Session
    Close Browser