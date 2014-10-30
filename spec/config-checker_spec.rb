require_relative '../lib/selenium-reporter/config-checker'

describe 'Config Checker -> ' do

  before(:each) do
    ENV['SE_OUTPUT_DIR'] = nil
  end

  it 'no output directory set' do
    expect { SeleniumReporter::ConfigChecker.new }.to raise_error(
      RuntimeError,
      'You need to specify an output directory (e.g., SE_OUTPUT_DIR).')
  end

end
