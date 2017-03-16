require 'appium_lib'
require 'page-object'
require 'faker'
require 'require_all'
require 'selenium-cucumber'
require 'selenium-webdriver'
require 'allure-cucumber'


PROJECT_DIR = File.expand_path(File.dirname(__FILE__) + '../../..')
load_all File.expand_path(File.dirname(__FILE__) + '/../../config/initializers')

require_all File.dirname(__FILE__) + '/../../lib/helpers'
require_all File.dirname(__FILE__) + '/../../lib/models'

World(PageObject::PageFactory)
RunConfiguration.instance.load_language('en')
require_all File.dirname(__FILE__) + '/../../lib/pages'


device_name, os_version = get_device_info

desired_caps = {
    caps: {
        platformName: 'Android',
        versionNumber: os_version,
        deviceName: device_name,
        appPackage: 'com.indeed.android.jobsearch',
        appActivity: 'com.indeed.android.jobsearch.MainActivity',
        autoGrantPermissions: true
    },
}

RunConfiguration.instance.browser = Appium::Driver.new(desired_caps).start_driver
RunConfiguration.instance.driver = $driver

#Make Appium's methods available to the world
Appium.promote_appium_methods Object

#Set default timeout for waiting an element
set_wait(RunConfiguration::DEFAULT_WAIT)

at_exit do
  driver_quit
end