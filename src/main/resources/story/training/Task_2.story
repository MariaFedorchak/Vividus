GivenStories: story/demo/Homepage_Demo.story

Scenario: Log in as a Good User
Given I am on main application page

When I enter `${swagGoodUserName}` in field located by `xpath(//input[@id="user-name"])`
And I enter `${swagPassword}` in field located by `xpath(//input[@id="password"])`
And I click on element located by `xpath(//*[@id="login-button"])`

Then the page with the URL 'https://www.saucedemo.com/inventory.html' is loaded
And number of elements found by `xpath(//a/img[contains(@class,inventory_item_img)])` is equal to `6`
When I take screenshot
