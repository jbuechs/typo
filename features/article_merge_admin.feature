Feature: Article Merge

 As a blog administrator
  In order to keep my blog organized
  I want to be able to merge similar articles on my blog

  Background:
  	Given the blog is set up
    Given I am logged into the admin panel
    Given the following article records
      | title    | author       | body                 | user_id | published |  
      | Hello!   | Ada Lovelace | Hello, world!        | 2       | true      |  
      | Goodbye! | Admin        | Goodbye, waterfalls! | 1       | true      |  
    Given the following comment records
    	| author          | body              | article_id | published |  
    	| Ada Lovelace    | Hello, article!   | 3          | true      |  
    	| Charles Babbage | Goodbye, article. | 4          | true      |  

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

  Scenario: Merge the comments of two articles
  	Given I am on the article page for "Hello!"
  	And the "Hello!" article should have 1 comment
  	When I go to the edit article page for "Hello!"
  	And I select "Goodbye!" from the dropdown
    And I press "Merge"
    Then the "Hello!" article should have 2 comments

  Scenario: Delete the merged article
  	Given I am on the home page
  	Then I should see "Goodbye!"
  	When I go to the edit article page for "Hello!"
  	And I select "Goodbye!" from the dropdown
    And I press "Merge"
    When I go to the homepage
    Then I should not see "Goodbye!"

