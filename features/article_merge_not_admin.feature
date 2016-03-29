Feature: Article Merge

 As a blog contributor
  In order to keep my blog organized
  I want to be able to merge similar articles on my blog

  Background:
  	Given the blog is set up
    Given I am logged in as contributor to the admin panel
    Given the following article records
      | title         | author       | body                 | user_id |  
      | Hello, world! | Ada Lovelace | Hello, world!        | 2       |  
      | Goodbye!      | Admin        | Goodbye, waterfalls! | 1       |  

  Scenario: Do not Display Merge Articles Button on Edit Page
    Given I am on the edit article page for "Hello, world!"
    Then I should not see "Merge Articles"
    And I should not see "Merge" button

  Scenario: Do not Display Merge Articles Button on New Page
    Given I am on the new article page
    Then I should not see "Merge Articles"
    And I should not see "Merge" button
