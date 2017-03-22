Given(/^I am a guest user$/) do
  on(LoginPage).login_guest
end

When(/^I am in "([^"]*)" country$/) do |country|
  on(SearchJobPage).change_country_search
  on(ChangeCountryPage).select_country(country)
end

When(/^I click on Create account$/) do
  sleep 3 #just for testing to be sure that the page is loaded (Bouh! bad practice)
  on(LoginPage).create_account
end
