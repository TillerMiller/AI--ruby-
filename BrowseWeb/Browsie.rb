#!/usr/bin/env ruby

require 'selenium-webdriver'
require 'active_support'
require 'faker'
require 'yaml'

def Search()
	$driver.navigate.to "http://bing.com"
	sleep 5
	searchBar = $driver.find_element(:name, 'q')
	searchBar.send_keys Faker::Company.catch_phrase()
	searchBar.submit
	sleep 5 
end

$config = YAML::load(File.read('config.yaml'))
#`export DISPLAY=:10`
sleep 5
$driver = Selenium::WebDriver.for :firefox
$driver.navigate.to "http://facebook.com"
email = $driver.find_element(:name, 'email')
email.send_keys $config['FACEBOOK_NAME']
pass = $driver.find_element(:name, 'pass')
pass.send_keys $config['FACEBOOK_PASS']
pass.submit

for i in 1..30 do
	$waitTimeMin = Random.rand(1...24)
	$waitTimeSec = Random.rand(1..60)
	sleep(($waitTimeMin * 60) + $waitTimeSec) #waitTime converted to seconds for sleep call
	Search()
	#sleep(((24 - $waitTimeMin) * 60) + (60 - $waitTimeSec)) #waitTime converted to seconds for sleep call
end

$driver.quit
