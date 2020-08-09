Feature: click counties map to see list of representatives

  As the user
  so that when I click a state on the map
  I want to see the state map with clickable counties
  And I want to be able to click a county in order to see the representatives for the county

Background: representatives in database

Given the following representatives exist:
| ocd_id  | name | title | created_at | updated_at |

Scenario: Click on county to access representatives list
  When I press "County Name"
  Then I should be on "County Name"
  And I should see "representative 1"
  And I should see "representative 2"
  And I should not see "representative 3"

Scenario: Access representative profile from representative list
  Given I am on "County Name"
  When I press "representative name"
  Then I should see "representative details"
