require_relative 'selenium-reporter/config-checker'
require_relative 'selenium-reporter/system/folder'
require 'uuid'
require 'rspec'

class SeleniumReporter

  attr_reader :output_dir

  def initialize
    ConfigChecker.new
    make_absolute ENV['SE_OUTPUT_DIR']
    System::Folder.prepare
    load_rspec_config
  end

  def screenshot_file
    "#{screenshot_dir}/#{UUID.new.generate}.png"
  end

  def generate_report
    system("java -jar #{allure_cli} generate #{xml_dir} -o #{report_dir}")
  end

  def serve_report
    ENV['SE_REPORT_DIR'] = report_dir
    @pid = Process.spawn('ruby lib/selenium-reporter/report-server.rb')
  end

  def stop_report
    Process.kill("KILL", @pid)
    ENV['SE_REPORT_DIR'] = nil
  end

  private

    def pwd
      Dir.pwd
    end

    def make_absolute(relative_path)
      @output_dir = File.join(pwd, ENV['SE_OUTPUT_DIR'])
      ENV['SE_OUTPUT_DIR'] = output_dir
    end

    def screenshot_dir
      output_dir + '/screenshot'
    end

    def xml_dir
      output_dir + '/xml'
    end

    def report_dir
      output_dir + '/report'
    end

    def allure_cli
      File.join(pwd, 'bin/allure/allure-cli-2.1.jar')
    end

    def load_rspec_config
      require 'nokogiri' # this is a dependent lib for allure-rspec
      require 'allure-rspec'
      AllureRSpec.configure do |c|
        c.output_dir = xml_dir
      end
    end

end
