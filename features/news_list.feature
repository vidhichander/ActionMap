Feature: adding issue and ratings columns to news articles

  As an politically interested user
  So that I can view articles based on topics and add my ratings to them
  I want to have the option to add issue or rating when creating article

Background: news articles have been added to database

Given I am on "Create News Article"


Scenario: Adding issue to news article
  When I press "issue dropdown"
  And I fill in "Issue option" with "News article name"
  And I press "create"
  Then the issue of "News article name" should be "Issue option"

Scenario: Adding rating to news article
  When I press "rating dropdown"
  When I fill in "Rating" with "News article name"
  And I press "create"
  Then the rating of "News article name" should be "Rating"
