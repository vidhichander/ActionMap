Feature: adding issue and ratings columns to news articles

  As an politically interested user
  So that I can view articles based on topics and add my ratings to them
  I want to have the option to add issue or rating when creating article

Background: issues have been added to database

Given the user table exists:
| provider                    | email | uid | first_name | last_name |
| google_oauth2                 | vidhichander@gmail.com     | 30023020010 | Vidhi | Chander |

And I am logged in
And I am on the representatives page

#announce
Scenario: Adding issue to news article
  When I fill in "address" with "Idaho"
  And I press "Search"
  Then I should see "Donald J. Trump"
  When I follow "Donald J. Trump"
  And I follow "News Articles"
  Then I should see "Listing News Articles for Donald J. Trump"
  And I should see "Issue"
  When I follow "Add News Article"
  Then I should see "Edit news article"
  And I should see "Issue"
  When I select "Immigration" from "Issue"
  And I select "Donald J. Trump" from "Representative"
  And I press "Save"
  Then I should see "Representative: Donald J. Trump"
  And I should see "Issue: Immigration"

#announce
Scenario: Adding rating to news article
When I fill in "address" with "Idaho"
And I press "Search"
Then I should see "Donald J. Trump"
When I follow "Donald J. Trump"
And I follow "News Articles"
Then I should see "Listing News Articles for Donald J. Trump"
And I should see "Rating"
When I follow "Add News Article"
Then I should see "Edit news article"
And I should see "Rating"
When I select "3" from "Rating"
And I select "Donald J. Trump" from "Representative"
And I press "Save"
Then I should see "Representative: Donald J. Trump"
And I should see "Rating: 3"
