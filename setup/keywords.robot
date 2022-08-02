*** Settings ***
Library           Collections
Library           SeleniumLibrary
Resource          constants.robot

*** Keywords ***
Open Certain Leage
    [Arguments]   ${selectElement}   ${selectValue}   ${leageElement}
    Wait Until Page Contains Element    //td/a[contains(text(),'آرسنال')]   timeout=3
    Sleep    10
    Select From List By Value  ${selectElement}  ${selectValue}
    Wait Until Page Contains Element    ${leageElement}   timeout=3
    Click Element  ${leageElement}

Get Rank of
    [Arguments]   ${teamElement}
    ${teamRank}=    Get Text  ${teamElement}
    BuiltIn.Log   ${teamRank}

Get Name Team of
    [Arguments]   ${teamRank}
    ${teamName}=   Get Text  //td[text()='${teamRank}']//following-sibling::td[1]/a
    BuiltIn.Log   ${teamName};
    [return]   ${teamName}

Get Name URL of
    [Arguments]   ${teamRank}
    ${teamUrl}=   Execute JavaScript    return document.querySelector("tbody > tr:nth-child(${teamRank}) > td > a").getAttribute('href');
    ${teamUrl} =   Catenate    ${baseUrl}${teamUrl}
    BuiltIn.Log   ${teamUrl};
    [return]   ${teamUrl}

Set localStorage
    [Arguments]   ${name}   ${value}
    Execute JavaScript   window.localStorage.setItem("${name}", "${value}");