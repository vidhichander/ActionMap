
require 'uri'
require 'cgi'

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^(?:|I )should see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)

  if page.respond_to? :should
    page.should have_xpath('//*', :text => regexp)
  else
    assert page.has_xpath?('//*', :text => regexp)
  end
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

Then /^(?:|I )should not see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)

  if page.respond_to? :should
    page.should have_no_xpath('//*', :text => regexp)
  else
    assert page.has_no_xpath?('//*', :text => regexp)
  end
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end


Then /^the issue of "([^"]*)" should be "([^"]*)"$/ do |news, issue|
  step %{I should see "#{news}"}
  step %{I should see "#{issue}"}
end

Then /^the rating of "([^"]*)" should be "([^"]*)"$/ do |news, rating|
  step %{I should see "#{news}"}
  step %{I should see "#{rating}"}
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^(?:|I )follows California/ do
  # visit state_map_path(State.where(:symbol => 'CA')[:symbol])
  visit ('/state/CA')
end

When /^(?:|I )follows Alameda County/ do
  visit('CA/county/001')
end

Given /the following states exist/ do |states_table|
  states_table.hashes.each do |state|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
      State.create!(state)
  end
end

Given /the following counties exist/ do |county_table|
  county_table.hashes.each do |county|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
      County.create!(county)
  end
end
