#!/usr/bin/env ruby

require 'selenium-webdriver'
require 'active_support'

sleep(0.minutes)

puts `export DISPLAY=:10`

for i in 1..30 do
	waitTime = RandomWait
	sleep(waitTimes * 60) #waitTime converted to seconds for sleep call
	Search
	sleep((24-waitTime) * 60) #waitTime converted to seconds for sleep call
end

def Search
	driver = Selenium::WebDriver.for :firefox
	driver.navigate.to "http://facebook.com"
	email = driver.find_element(:name, 'email')
	email.send_keys "you@email.here"
	pass = driver.find_element(:name, 'pass')
	pass.send_keys "######"
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
