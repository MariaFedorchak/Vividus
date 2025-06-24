Meta:
    @group Training
    @requirementId MyTask-0007

Lifecycle:
Examples:
|userName|Pasword|
|standard_user|secret_sauce|

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

Scenario: Populate checkout data
Given I am on page with URL `https://www.saucedemo.com/inventory.html`
Given I initialize story variable `firstName` with value `#{generate(Name.firstName)}`
Given I initialize story variable `lastName` with value `#{generate(regexify '[A-Z]{3}[a-z]{4}')}`
Given I initialize story variable `postalCode` with value `#{generate(regexify '[A-Z]{3}')}-#{generate(regexify '[2-8]{5}')}`
When I click on element located by `xpath(//*[@id="shopping_cart_container"])`
Then the page with the URL 'https://www.saucedemo.com/cart.html' is loaded
When I click on element located by `xpath(//button[@id="checkout"])`
Then the page with the URL 'https://www.saucedemo.com/checkout-step-one.html' is loaded
When I enter `${firstName}` in field located by `xpath(//input[@id="first-name"])`
And I enter `${lastName}` in field located by `xpath(//input[@id="last-name"])`
And I enter `${postalCode}` in field located by `xpath(//input[@id="postal-code"])`
And I take screenshot

Scenario: Complete checkout process
When I click on element located by `xpath(//input[@id="continue"])`
Then the page with the URL 'https://www.saucedemo.com/checkout-step-two.html' is loaded
When I click on element located by `xpath(//button[@id="finish"])`
Then the page with the URL 'https://www.saucedemo.com/checkout-complete.html' is loaded
When I save text of element located by `xpath(//div/h2[@class="complete-header"])` to story variable `$endText`
Given I initialize scenario variable `$savedText` with value `#{loadResource(/data/message.txt)}`
Then `#{eval($endText)}` is equal to `#{eval($savedText)}`
