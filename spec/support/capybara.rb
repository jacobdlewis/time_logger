require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.match = :prefer_exact
Capybara.javascript_driver = :poltergeist