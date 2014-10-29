require_relative '../lib/selenium-reporter'
require 'selenium-webdriver'
require 'typhoeus'

describe 'selenium-reporter' do

  before(:each) do
    ENV['SE_OUTPUT_DIR'] = 'spec/results'
    @reporter = SeleniumReporter.new
    driver = Selenium::WebDriver.for :firefox
    driver.get 'http://the-internet.herokuapp.com'
    driver.save_screenshot(@reporter.screenshot_file)
    driver.quit
  end

  it 'provides a unique file with output directory' do
    ENV['SE_OUTPUT_DIR'] = 'results'
    screenshot_file = SeleniumReporter.new.screenshot_file
    expect(screenshot_file).to include(ENV['SE_OUTPUT_DIR'])
    expect(screenshot_file).to include('.png')
  end

  it 'compiles output into a consolidated report' do
    @reporter.generate_report
    expect($?.exitstatus).to eql 0
  end

  it 'consolidated report is viewable in a browser' do
    @reporter.serve_report
    sleep 4
    expect(Typhoeus.get('http://localhost:4567/', followlocation: true).code).to eql 200
    @reporter.stop_report
  end

end
