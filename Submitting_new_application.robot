*** Settings ***
Library    SeleniumLibrary
Test Setup      Invoking the Chrome Browser
Test Teardown   Close Browser session
Resource    Generic.robot

*** Test Cases ***
Filling and Submitting the Application
	Invoking the Chrome Browser
	Accepting Cookies
	Clicking on Login
	Entering Credentials
	Clicking on Submit new application
	filling the names details
	filling address
	uploading photo
    selecting gender and role
    Switching to Frame
    Submitting the form and Valiadting

*** Keywords ***
Accepting Cookies
	Wait Until Element Is Visible    css:button[id='cookie-allow-necessary-button']
	Click Element      css:button[id='cookie-allow-necessary-button']
Clicking on Login
	Click Element    css:a[href="/en/user/login/"]
Entering Credentials
	Input Text    css:input[id="login-email"]       ${user_name}
	Wait Until Element Is Visible    css:input[id="login-password"]
	Input Password    css:input[id="login-password"]    ${valid_password}
	Wait Until Element Is Visible    css:.btn.btn-lg.btn-primary.col-12.mt-1.mt-md-2
	Click Element    css:.btn.btn-lg.btn-primary.col-12.mt-1.mt-md-2
Clicking on Submit new application
	Click Element    css:a[href="project/new/"]
	Click Element    css:a[href="/en/project/new/controller.php?formId=33094353-3668-5272-97bc-592d0380a9c7&force"]
filling the names details
	Input Text    css:input[aria-label='First name']     Rahul
	Input Text    css:input[aria-label='Last name']  Kumar
filling address
	Input Text    css:.form-control.d-block     Bengalore
	Input Text    css:.form-control.ui-autocomplete-input       1000
	Select From List By Value    css:select[id='7e595970-fc12-558c-9eaf-385735fcae6b']      IN
uploading photo
    Choose File     css=.btn.btn-outline-primary.qq-upload-button-selector      C:\Users\Hp\Downloads\upload.jpg
selecting gender and role
	Click Element    css:label[aria-label='Male'] div[class='d-flex align-items-center py-1 px-3']
	Select From List By Value    css:select[id='field_f801d7d8-0762-5407-95f9-b8c3a793157c']        6365118b-637a-5297-b56d-e7c8b9a60ce0
	Click Element    css:label[aria-label='Python'] div[class='custom-control-label radio-checkbox-li-element-label']
Switching to Frame
    Select Frame    css=iframe.cke_wysiwyg_frame.cke_reset
	Input Text    css=iframe.cke_wysiwyg_frame.cke_reset        This is frame
	Unselect Frame
Submitting the form and Valiadting
	Click Element    css:button[id='navButtonNext']
	Click Element    css:body > div:nth-child(1) > main:nth-child(6) > div:nth-child(1) > div:nth-child(1) > div:nth-child(32) > div:nth-child(1) > form:nth-child(1) > div:nth-child(4) > div:nth-child(2) > div:nth-child(4) > div:nth-child(2) > button:nth-child(1)
    ${SuccessMSG}   Get Text    css:h1[class='h1 col-md-12 text-dark']
    Should Be Equal As Strings    ${SuccessMSG}     Manage my applications