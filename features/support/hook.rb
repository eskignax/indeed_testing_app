Before do
  @browser = RunConfiguration.instance.browser
end

After do |scenario|
  if scenario.failed?
    filename = Time.now.strftime('%Y-%m-%d_%H-%M-%S')
    source = RunConfiguration.instance.driver.get_source rescue 'No Source'
    screenshot_file_path = "report/#{filename}.png"
    RunConfiguration.instance.driver.screenshot("#{screenshot_file_path}")
    embed("#{screenshot_file_path}", "image/png")
    File.write("report/#{filename}.xml", source)
    unless AllureCucumber::FeatureTracker.tracker.nil?
      scenario.attach_file(file_name: "#{filename}.png", file_path: "report/#{filename}.png", file_extension: 'png')
      scenario.attach_file(file_name: "#{filename}.xml", file_path: "report/#{filename}.xml", file_extension: 'xml')
    end
  end
end
