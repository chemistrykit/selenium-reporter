= selenium-reporter

== DESCRIPTION:

A report helper, generator, and viewer for Selenium that displays failure screenshots and stacktraces in an HTML digest.

== INSTALLATION:

gem install selenium-reporter

== USAGE:

=== Environment Variables

SE_OUTPUT_DIR (relative path to where you want to store screenshots and the final report)

=== Capturing Screenshots

ENV['SE_OUTPUT_DIR'] = 'results'
reporter = SeleniumReporter.new
driver = Selenium::WebDriver.for :firefox
driver.save_screenshot(reporter.screenshot_file)

NOTE: This will overwrite result output from previous test runs

=== Generating a Report

reporter.generate_report

NOTE: This will generate an HTML report in a sub-directory within the output directory you specified

=== Viewing a Report

reporter.serve_report

NOTE: This will start a local web server and make the final report available at http://localhost:4567

== LICENSE:

The MIT License (MIT)

Copyright (c) 2014 Dave Haeffner

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
