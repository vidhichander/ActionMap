Feature: display representatives profile upon searching address

  As a user
  So that I can enter a representative candidate address in the search bar
  I want to see the corresponding representative

Background: representative data has been added to database

Scenario: Search for representative address in search field 1
  Given I am on the representatives page
  When I fill in "address" with "Idaho"
  And I press "Search"
  Then I should see "Brad Little"
  And I should see "Donald J. Trump"
  When I follow "Donald J. Trump"
  Then I should see "Donald J. Trump"
  Then I should see "Republican Party"
  And I should see "Washington"
  And I should see "(202) 456-1111"
  And I should not see "James E. Risch"

  Scenario: Search for representative address in search field 2
    Given I am on the representatives page
    When I fill in "address" with "Idaho"
    And I press "Search"
    Then I should see "Brad Little"
    And I should see "Donald J. Trump"
    When I follow "Brad Little"
    Then I should see "Brad Little"
    Then I should see "Republican Party"
    And I should see "Boise"
    And I should not see "Donald J. Trump"

Scenario: representative not found
  Given I am on the representatives page
  When I fill in "address" with "error"
  And I press "Search"
  Then I should be on the representatives page
  And I should see "Invalid"

Scenario: Access representative profile from news_page
  Given I am on the representatives page
  When I fill in "address" with "Idaho"
  And I press "Search"
  Then I should see "Donald J. Trump"
  When I follow "Donald J. Trump"
  And I press "News Articles"
  Then I should see "Listing News Articles for Donald J. Trump"
  When I follow "Donald J. Trump"
  Then I should see "Donald J. Trump"
  And I should see "Republican Party"
  And I should see "Washington"
  And I should not see "Listing"
