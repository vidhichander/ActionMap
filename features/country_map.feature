Feature: click counties map to see list of representatives

  As the user
  so that when I click a state on the map
  I want to see the state map with clickable counties
  And I want to be able to click a county in order to see the representatives for the county

Background: state data in database

  Given the following states exist:
  | name                    | symbol | fips_code | is_territory | lat_min | lat_max | long_min | long_max |
  | Alabama                 | AL     | 01        | 0            |-88.473227|-84.88908|30.223334|-84.88908|
  | California              | CA     | 06 |0|-124.409591|-114.131211|32.534156|-114.131211|

  And I am on the Home page

Scenario: Click on county to access representatives list
  When I follows California
  Then I should see "California"
  And I follows Alameda County
  And I should see "representative 2"
  And I should see "representative 3"

Scenario: Access representative profile from representative list
  Given I am on "County Name"
  When I press "representative name"
  Then I should see "representative details"
