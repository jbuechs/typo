Feature: Article Merge

 As a blog administrator
  In order to keep my blog organized
  I want to be able to merge similar articles on my blog

  Background:
  	Given the blog is set up
    Given I am logged into the admin panel
    Given the following article records
      | title         | author       | body                 | user_id | published |  
      | Hello! | Ada Lovelace | Hello, world!        | 2       | true      |  
      | Goodbye!      | Admin        | Goodbye, waterfalls! | 1       | true      |  

  Scenario: Display Merge Articles Button to Admin on Edit Page
    Given I am on the edit article page for "Hello!"
    Then I should see "Merge Articles"
    And I should see "Merge" button

  Scenario: Do not Display Merge Articles Button to Admin on New Page
    And I am on the new article page
    Then I should not see "Merge Articles"
    And I should not see "Merge" button

  Scenario: Merge text of two articles
    Given I am on the edit article page for "Hello!"
    And I select "Goodbye!" from the dropdown
    And I press "Merge"
    Then I should be on the edit article page for "Hello!"
    When I go to the article page for "Hello!"
    Then I should see "Goodbye, waterfalls!"
    And I should see "Hello, world!"