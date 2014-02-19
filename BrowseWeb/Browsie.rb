#!/usr/bin/env ruby

require 'selenium-webdriver'
require 'active_support'

sleep(0.minutes)

puts `export DISPLAY=:10`

for i in 1..30 do
	waitTime = RandomWait
	sleep(waitTime.minutes)
	Search
	sleep((24-waitTime).minutes)
end

def Search
	driver = Selenium::WebDriver.for :firefox
	driver.navigate.to "http://facebook.com"
	email = driver.find_element(:name, 'email')
	email.send_keys "millert@go.byuh.edu"
	pass = driver.find_element(:name, 'pass')
	pass.send_keys "nothing0"
	pass.submit
	driver.navigate.to "http://bing.com"
	searchBar = driver.find_element(:name, 'q')
	searchBar.send_keys "search"
	searchBar.submit
	driver.quit
end

def RandomWaitTime
	num = Random.rand(1...24)
end
