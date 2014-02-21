#!/usr/bin/env ruby

require 'selenium-webdriver'
require 'faker'
require 'yaml'
require 'i_heart_quotes'

def Search()
	$driver.navigate.to "http://bing.com"
	sleep 5
	searchBar = $driver.find_element(:name, 'q')
	case Random.rand(1...8)
		when 1 then searchBar.send_keys IHeartQuotes::Client.random.quote()
		when 2 then searchBar.send_keys IHeartQuotes::Client.random.source()
		when 3 then searchBar.send_keys Faker::Address.state() 
		when 4 then searchBar.send_keys Faker::Address.city()
		when 5 then searchBar.send_keys Faker::Address.country()
		when 6 then searchBar.send_keys Faker::Commerce.product_name()
		when 7 then searchBar.send_keys Faker::Company.catch_phrase()
		when 8 then searchBar.send_keys Faker::Company.name()
		when 9 then searchBar.send_keys Faker::Name.name()
	end
	searchBar.submit
	sleep 5 
end

$config = YAML::load(File.read('config.yaml'))
#`export DISPLAY=:10` # this line is for starting xvfb headless server
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
