*** Settings ***
Library    Collections
Library    SeleniumLibrary
Library    RequestsLibrary



*** Variables ***
${Baseurl}    https://rahulshettyacademy.com
${idvalue}
${booknames}    Learn Appium Automation with Java







*** Test Cases ***
#Playaround with the Dictionary
#    creating the dictionary in robot
Add A new Book into the library
    Post request for adding a book into the library
    Get request to pass and get the response



*** Keywords ***
creating the dictionary in robot
    &{data}=    Create Dictionary    name=krishna    age=24    place=trichy
    Dictionary Should Contain Key    ${data}    name
    Log    ${data}
#    retriveing the value of a key 
    Log    ${data}[name]
    ${key}=    Get From Dictionary    ${data}    name
    Log    ${key}
Post request for adding a book into the library
    &{postdict}=    Create Dictionary    name=Learn Appium Automation with Java    isbn=xyi    aisle=22020    author=John foe
    ${response}=    POST    ${Baseurl}/Library/Addbook.php    json=${postdict}    expected_status=200
#    storing the response body and extracting it 
    Log    ${response.json()}
#    treating it as a dictionary and validating the key and the value
     Dictionary Should Contain Key    ${response.json()}    ID
     ${idvalue}=    Get From Dictionary    ${response.json()}    ID
     Set Global Variable    ${idvalue}
     Log    ${idvalue}
     Log    Set global variable ${idvalue}

#     Retrieving the msg value from the response Json 
    ${msgvalue}=    Get From Dictionary    ${response.json()}    Msg
    Log    ${msgvalue}
    Set Global Variable    ${msgvalue}
#    Should Be Equal As Strings    successfully added    ${msgvalue}


Get request to pass and get the response
    Log    Using Global ID: ${idvalue}
    
    ${getresponse}=    GET    ${Baseurl}/Library/GetBook.php    params=ID=${idvalue}
    Log    ${getresponse.json()}
#    retrieving the author name it is list of dictionary so use like this
    ${nameofbook}=    Get From Dictionary    ${getresponse.json()}[0]    book_name
    Log    ${nameofbook}
    Should Be Equal As Strings    ${booknames}    ${nameofbook}




