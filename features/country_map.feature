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

#announce
Scenario: Click on county to access representatives list
  When I follows California
  Then I should see "California"
  When I follows Alameda County
  Then I should see "Mike Pence"
  And I should see "Betty T. Yee"
  When I follow "Mike Pence"
  Then I should see "Republican Party"
  And I should not see "Betty T. Yee"
