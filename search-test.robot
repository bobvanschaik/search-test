*** Settings ***
Library    SeleniumLibrary
Variables    ../development/robot/variables.yaml
Resource    ../development/robot/keywords.resource
Force Tags    regression    web    # Applies to all tests in this suite
Default Tags    smoke         # Applies to all tests unless overridden

*** Test Cases ***

Open Browser and Search
    [Documentation]    Test that the search functionality works on Google
    Log    Starting test: Open Browser and Search    level=INFO
    Open Search Page
    Log    Browser opened successfully    level=INFO
    Search For    Robot Framework
    Log    Search executed for 'Robot Framework'    level=INFO
    Close Browser
    Log    Browser closed    level=INFO
	
   # How to run specific tests:
   # Run all tests with the smoke tag: robot --include smoke tests/
   # Run only high-priority tests: robot --include high-priority tests/
   # Run regression tests for the web: robot --include regression --include web tests/
   # Exclude specific tags: robot --exclude low-priority tests/