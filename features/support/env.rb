require 'selenium-webdriver'
require 'capybara'
require 'capybara/cucumber'
require 'random-word'


$browser = ENV['browser'] ||:chrome
$browser = $browser.to_sym

$driver = ENV['driver'] || :selenium
$driver = $driver.to_sym

Capybara.default_driver = $driver
Capybara.default_selector = :xpath

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => $browser,)
end
