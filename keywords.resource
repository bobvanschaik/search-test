*** Keywords ***
Open Search Page
    [Documentation]    Opens the search page in a private/incognito browser
    Log    Opening private browser to ${site}    level=DEBUG
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --incognito
    Create WebDriver    Chrome    options=${options}
    Go To    ${site}
    Handle Cookie Consent Popup

Handle Cookie Consent Popup
    [Documentation]    Clicks the "Accept all" button using its ID (L2AGLb)
    Wait Until Page Contains Element    id=L2AGLb    10s    error=Popup not found
    Click Element    id=L2AGLb
    Log    Cookie consent popup dismissed    level=INFO

Search For
    [Arguments]    ${query}
    [Documentation]    Searches for the given query
    Log    Entering search term: ${query}    level=DEBUG
    Input Text      ${search_field}    ${query}
    Press Keys      ${search_field}    ENTER