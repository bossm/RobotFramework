*** Settings ***
Library  AppiumLibrary
Library  BuiltIn


*** Variables ***
${ANDROID_AUTOMATION_NAME}    uiautomator2
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=7}
${ANDROID_APP_PACKAGE}        com.android.chrome
${ANDROID_DEVICE_NAME}        emulator-5554
${appActivity}                com.google.android.apps.chrome.Main


*** Keywords ***
Open Android Test App
  [Arguments]    ${appActivity}=${EMPTY}
  open application  http://127.0.0.1:4723/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}
  ...  appPackage=${ANDROID_APP_PACKAGE}  appActivity=${appActivity}