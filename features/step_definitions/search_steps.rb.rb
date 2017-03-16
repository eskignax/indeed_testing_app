When(/^I make a search in "([^"]*)" city$/) do |city|
  on(SearchJobPage).search(where: city)
end

When(/^I click on the search suggestion$/) do
  on(SearchResultsPage).search_suggestion
end

Then(/^I should see the location not found in the results$/) do
  expect(on(SearchResultsPage)).to have_location_not_found
end

Then(/^I should see some results$/) do
  expect(on(SearchResultsPage)).to_not have_location_not_found
  expect(@current_page).to have_some_results
end


Then(/^I should see the search suggestion 'Did you mean "([^"]*)"'$/) do |suggestion|
  expect(on(SearchResultsPage)).to have_search_suggestion(suggestion)
end
