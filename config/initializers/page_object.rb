module PageObject

  def page_ready_state_complete?
    Appium.execute_script('return document.readyState').match(/complete/)
  end

end