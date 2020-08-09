Feature: display representatives profile upon searching address

  As a user
  So that I can enter a representative candidate address in the search bar
  I want to see the corresponding representative

Background: representative data has been added to database

  Given the following representatives exist:
  | ocd_id  | name | title | created_at | updated_at |

Scenario: Search for representative address in search field
  Given I am on the representatives page
  When I fill in "address" with "Address"
  And I press "Search"
  Then I should see "name"
  And I should see "some other detail of the representative"
  And I should not see "another representative"

Scenario: representative not found
  Given I am on the representatives page
  When I fill in "address" with "Address"
  And I press "Search"
  Then I should be on "homepage"
  And I should see "a flash notification"

Scenario: Access representative profile from news_page
  Given I am on "news article"
  When I press "representative name"
  Then I should see "name"
  And I should see "some other detail of the representative"
  And I should not see "another representative"
