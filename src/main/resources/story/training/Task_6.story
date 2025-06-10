Meta:
    @group Training
    @requirementId MyTask-0006

Lifecycle:
Examples:
|userName|Pasword|
|standard_user|secret_sauce|
|performance_glitch_user|secret_sauce|

Scenario: Navigate to the website homepage
Given I am on main application page
When I wait until element located by `caseSensitiveText(Swag Labs)` appears
Then `${current-page-url}` is equal to `https://www.saucedemo.com/`
When I take screenshot

Scenario: Log In
Given I am on main application page
When I enter `<userName>` in field located by `xpath(//input[@id="user-name"])`
And I enter `<Pasword>` in field located by `xpath(//input[@id="password"])`
And I click on element located by `xpath(//*[@id="login-button"])`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`

Scenario: Add item to the shopping cart
Given I am on page with URL `https://www.saucedemo.com/inventory.html`
When I click on element located by `<itemName>`
Then `${current-page-url}` is equal to `<itemPageId>`
When I click on element located by `<addToCartButtonId>`
And I click on element located by `xpath(//*[@id="back-to-products"])`
Examples:
|itemName|itemPageId|addToCartButtonId|
|xpath(//div/a[@id="item_4_img_link"])|https://www.saucedemo.com/inventory-item.html?id=4|xpath(//*[@id="add-to-cart"])|
|xpath(//div/a[@id="item_0_img_link"])|https://www.saucedemo.com/inventory-item.html?id=0|xpath(//*[@id="add-to-cart"])|
|xpath(//div/a[@id="item_1_img_link"])|https://www.saucedemo.com/inventory-item.html?id=1|xpath(//*[@id="add-to-cart"])|

Scenario: Validate the num of items in the shopping cart
Given I am on page with URL `https://www.saucedemo.com/inventory.html`
When I click on element located by `xpath(//*[@id="shopping_cart_container"])`
Then the page with the URL 'https://www.saucedemo.com/cart.html' is loaded
And number of elements found by `cssSelector(div.cart_item)` is equal to `3`

Scenario: Log Out
Given I am on page with URL `https://www.saucedemo.com/cart.html`
When I click on element located by `xpath(//*[@id="react-burger-menu-btn"])`
When I wait until element located by `cssSelector(div.bm-menu)` appears
When I click on element located by `xpath(//*[@id="logout_sidebar_link"])`
Then the page with the URL 'https://www.saucedemo.com/' is loaded
