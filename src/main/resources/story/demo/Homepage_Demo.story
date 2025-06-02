Scenario: Navigate to the SauceDemo website homepage
Given I am on main application page
When I navigate to the website homepage
When I take screenshot
When I COMPARE_AGAINST baseline with name `loginPage` ignoring:
|ACCEPTABLE_DIFF_PERCENTAGE	|
|5				            |
