*** Settings ***
Library           Collections
Library           SeleniumLibrary

*** Variables ***
${platformName}=  Android
${platformVersion}=  7.0
${deviceName}=  emulator-5554
${browserName}=  chrome
${androidPackage}=  com.android.chrome

*** Keywords ***
Configuration Android
    ${Options}    Create Dictionary    androidPackage    ${androidPackage}    addArguments    incognito
    ${caps}    Create Dictionary    chromeOptions    ${Options}
    Set to Dictionary    ${caps}    platformName    ${platformName}
    Set to Dictionary    ${caps}    platformVersion    ${platformVersion}
    Set To Dictionary    ${caps}    deviceName    ${deviceName}
    Set To Dictionary    ${caps}    browserName   ${browserName}
    Create Webdriver    Remote    command_executor=http://localhost:4723/wd/hub    desired_capabilities=${caps}