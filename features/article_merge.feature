Feature: Article Merge

 As a blog administrator
  In order to keep my blog organized
  I want to be able to merge similar articles on my blog

  Background:
  	Given the blog is set up

  Scenario: Display Merge Articles Button to Admin
    Given I am logged into the admin panel
    And I am on the new article page
    Then I should see "Merge Articles"
    And I should see "Merge" button

  Scenario: Do not Display Merge Articles Button to Contributor
    Given I am logged in as contributor to the admin panel
    And I am on the new article page
    Then I should not see "Merge Articles"
    And I should not see "Merge" button

  Scenario: Merge text of two articles
    Given the following article records
      | title | author | body | user_id |
