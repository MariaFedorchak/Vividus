GivenStories: story/demo/Homepage_Demo.story

Scenario: Log in as a User
Given I am on main application page


When I log in as a Good User


Then the page with the URL 'https://www.saucedemo.com/inventory.html' is loaded
And number of elements found by `xpath(//a/img[contains(@class,inventory_item_img)])` is equal to `6`
When I take screenshot
When I COMPARE_AGAINST baseline with name `homepage` ignoring:
|ELEMENT	                               |ACCEPTABLE_DIFF_PERCENTAGE	|
|xpath(//*[@class='inventory_item_img'])|  5                         |
