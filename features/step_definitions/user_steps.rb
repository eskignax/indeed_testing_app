Given(/^I am a guest user$/) do
  on(LoginPage).login_guest
end

And(/^I am in "([^"]*)" country$/) do |country|
  on(SearchJobPage).change_country_search
  on(ChangeCountryPage).select_country(country)
end