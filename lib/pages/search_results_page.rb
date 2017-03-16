class SearchResultsPage
  include PageObject

  REGEX_JOB_ID = /job_[0-9a-f]+/

  attr_reader :search_suggestion

  element :location_not_found, 'android.view.View', id: 'location_not_found'
  element :suggestion, 'android.view.View', xpath: "//android.view.View[contains(@content-desc,\"#{RunConfiguration.instance.strings[:search_results_page][:search_suggestion]}\")]"
  elements :views, 'android.view.View', xpath:'//android.view.View'


  def search_suggestion
    suggestion_element.click
    wait_until{!suggestion_element.visible?}
  end

  def has_search_suggestion?(suggestion)
      suggestion_element.visible? && ( suggestion_element.attribute('name').match /#{suggestion}/ )
  end

  def has_location_not_found?
    location_not_found_element.exists? && location_not_found_element.visible?
  end

  def has_some_results?
    job_results.size > 0
  end

  protected

  def job_results
    views_elements.find_all{|e| e.attribute('resourceId').match REGEX_JOB_ID rescue false}
  end

end

