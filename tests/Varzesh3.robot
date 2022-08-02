*** Settings ***
Library           Collections
Library           SeleniumLibrary
Resource          ../setup/config.robot
Resource          ../setup/constants.robot
Resource          ../setup/keywords.robot

*** Variables ***

*** Test Cases ***
E2E scenario of Varzesh3 test
    Configuration Android
    Go To  ${baseUrl}
    Click Element  //H2[text()="جدول لیگ های خارجی"]
    Open Certain Leage   //div[@id='84']//select[@id='stage']   902082   //div/a[contains(@href,'لالیگا')]
    Page Should Contain Element  //td/a[contains(@href,'بارسلونا')]
    Get Rank of   //td/a[contains(@href,'بارسلونا')]/parent::td/preceding::td
    ${secondTeamName}=   Get Name Team of   2
    ${secondTeamUrl}=   Get Name URL of   2
    BuiltIn.Log   ${secondTeamUrl};
    Set localStorage   'Second Team Name'   ${secondTeamName}
    ${firstTeamName}=    Get Name Team of   1
    ${firstTeamUrl}=   Get Name URL of   1
    Set localStorage   'Second Team Name'   ${firstTeamName}
    Go To 	 ${firstTeamUrl}