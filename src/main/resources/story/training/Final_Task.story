Meta:
    @group Training
    @requirementId MyTask-Final


Scenario: Check the title is correct
Given I am on main application page
Then page title is equal to `EPAM | Software Engineering & Product Development Services`

Scenario: Check the ability to switch Light / Dark mode Steps
Given I am on main application page
When I save `class` attribute value of element located `xpath(//HTML/body)` to scenario variable `$bodyClass`
And I click on element located by `xpath(//section/div/div[@class="switch"])`
And I save `class` attribute value of element located `xpath(//HTML/body)` to scenario variable `$bodyCclass`
Then `${bodyClass}` is not equal to `${bodyCclass}`

Scenario: Check that allow to change language to UA
Given I am on main application page
When I click on element located by `xpath(//button[@class="location-selector__button"])`
And I wait until element located by `xpath(//nav[@class="location-selector__panel"])` appears
When I click on element located by `xpath(//li/a[@lang="uk"])`
Then `${current-page-url}` is equal to `https://careers.epam.ua/`
When I close browser

Scenario: Check the policies list
Given I am on main application page
When I scroll element located by `xpath(//div[@class="policies"])` into view
Then an element with the tag 'a' and text '<policyName>' exists
Examples:
|policyName|
|INVESTORS|
|COOKIE POLICY|
|OPEN SOURCE|
|APPLICANT PRIVACY NOTICE|
|PRIVACY POLICY|
|WEB ACCESSIBILITY|

Scenario: Check that allow to switch location list by region
Given I am on main application page
Then an element with the tag '<locationTag>' and text '<locationName>' exists
When I click on an element with the text '<locationName>'
Then number of elements found by `<locationCountry>` is greater than `0`
Examples:
|locationTag|locationName|locationCountry|
|a|AMERICAS|xpath(//img[@alt="Canada"])|
|a|EMEA|xpath(//img[@alt="Austria"])|
|a|APAC|xpath(//img[@alt="Japan"])|

Scenario:Check the search function
Given I am on main application page
When I click on element located by `xpath(//li/div/button[@class="header-search__button header__icon"])`
And I wait until element located by `xpath(//div/input[@id="new_form_search"])` appears
When I enter `${inputSearch}` in field located by `xpath(//div/input[@id="new_form_search"])`
And I click on element located by `xpath(//button[@class="custom-button button-text font-900 gradient-border-button large-gradient-button uppercase-text custom-search-button"])`
Then `${current-page-url}` is equal to `https://www.epam.com/search?q=AI`
Then number of elements found by `xpath(//article[@class="search-results__item"])` is greater than `0`

Scenario: Check that the Company logo on the header lead to the main page
Given I am on page with URL `https://www.epam.com/about`
When I click on element located by `xpath(//div/a[@href="https://www.epam.com"])`
Then `${current-page-url}` is equal to `https://www.epam.com/`
