# README #

#Indeed APK test

### What is this repository for? ###
Testing framework for Grab Passenger APP in ruby

### How do I get set up? ###
#### Install
 + android sdk
 + appium
 + ruby

#### Run Appium
        appium --default-capabilities "{\"newCommandTimeout\": \"300\", \"appPackage\": \"'com.indeed.android.jobsearch'\", \"appActivity\": \"''com.indeed.android.jobsearch.MainActivity''\"}"
#### Run emulator
        emulator -avd [devicename]
#### Run the test
        cucumber
#### Run the test with allure report
        cucumber -p allure
        


