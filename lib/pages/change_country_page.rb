class ChangeCountryPage
  include PageObject

  elements(:country_list, 'android.view.View', xpath:'//android.view.View')

  def select_country(country)
    wait_until(5, 'List of countries not loaded'){country_list_elements.size > 0}
    country_list_elements.find{|e| e.attribute('name').match /#{country}/}.when_visible.click
  end

end