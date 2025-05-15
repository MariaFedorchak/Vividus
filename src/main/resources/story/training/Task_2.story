GivenStories: story/demo/Homepage_Demo.story

Scenario: Log in as a Good User
Given I am on page with URL ${web-application.main-page-url}

When I wait until element located `$d=username` appears
And I enter `${swagGoodUserName}` in field located by `id=username`
And I enter `${swagPassword}` in field located by `id=password`
And I click on element located by `id=login-button`

Then I wait until element located by `xpath=//span[text()="Products"]` appears
