GivenStories: story/demo/Homepage_Demo.story

Scenario: Log in as a User
Given I am on main application page


When I log in as a Locked User


Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
And number of elements found by `xpath(//a/img[contains(@class,inventory_item_img)])` is equal to `6`
When I take screenshot
