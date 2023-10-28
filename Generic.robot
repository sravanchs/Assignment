*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${user_name}             optimyautomationtester@gmail.com
${valid_password}        yRMhojb7
${url}                   https://automationinterface1.front.staging.optimy.net/en/
${browser_name}          Chrome

*** Keywords ***
Invoking the Chrome Browser
	Create Webdriver    ${browser_name}
	Go To    ${url}
Close Browser session
	Close Browser
