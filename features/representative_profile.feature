Feature: display representatives profile upon searching address

  As a user
  So that I can enter a representative candidate address in the search bar
  I want to see the corresponding representative

Background: representative data has been added to database

Given the following states exist:
| name                    | symbol | fips_code | is_territory | lat_min | lat_max | long_min | long_max |
| Alabama                 | AL     | 01        | 0            |-88.473227|-84.88908|30.223334|-84.88908|
| California              | CA     | 06 |0|-124.409591|-114.131211|32.534156|-114.131211|


#announce
Scenario: Search for representative address in search field 1
  Given I am on the representatives page
  When I fill in "address" with "Alabama"
  And I press "Search"
  Then I should see "Kay Ivey"
  And I should see "Donald J. Trump"
  When I follow "Donald J. Trump"
  Then I should see "Donald J. Trump"
  Then I should see "Republican Party"
  And I should see "Washington"
  And I should see "(202) 456-1111"
  And I should not see "James E. Risch"

#announce
Scenario: Search for representative address in search field 2
  Given I am on the representatives page
  When I fill in "address" with "Alabama"
  And I press "Search"
  Then I should see "Kay Ivey"
  And I should see "Donald J. Trump"
  When I follow "Kay Ivey"
  Then I should see "Governor of Alabama"
  And I should see "Dexter"
  And I should not see "Donald J. Trump"

#announce
Scenario: representative not found
  Given I am on the representatives page
  When I fill in "address" with "error"
  And I press "Search"
  Then I should be on the representatives page
  And I should see "Invalid"

#announce
Scenario: Access representative profile from news_page index
  Given I am on the representatives page
  When I fill in "address" with "Alabama"
  And I press "Search"
  Then I should see "Donald J. Trump"
  When I follow "Donald J. Trump"
  And I follow "News Articles"
  Then I should see "Listing News Articles for Donald J. Trump"
  When I follow "Donald J. Trump"
  Then I should see "Donald J. Trump"
  And I should see "Republican Party"
  And I should see "Washington"
  And I should not see "Listing"
