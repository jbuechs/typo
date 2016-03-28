Feature: Categories
  As a blog administrator
  In order to share my thoughts with the world
  I want to be able to create and manage categories to my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully add new category
    Given I am on the new category page
    When I fill in "category_name" with "Foobar"
    And I press "Save"
    Then I should be on the new category page
    And I should see "Foobar"
    And page should have success message "Category was successfully saved."

  Scenario: Error message with blank new category
    Given I am on the new category page
    And I press "Save"
    Then I should be on the new category page
    And page should have error message "Category could not be saved."

  Scenario: Update a category
    Given the following category records
      | name | 
      | Foobar | 
    And I am on the edit page for "Foobar"
    When I fill in "category_name" with "Foobaz"
    And I press "Save"
    Then I should be on the new category page
    And I should see "Foobaz"
    And page should have success message "Category was successfully saved."

  Scenario: Error message with blank update category
    Given the following category records
      | name | 
      | Foobar | 
    And I am on the edit page for "Foobar"
    When I fill in "category_name" with ""
    And I press "Save"
    Then I should be on the new category page
    And I should see "Foobar"
    And page should have error message "Category could not be saved."