require 'sinatra/base'

class SeleniumReporter
  class ReportServer < Sinatra::Base

    set :public_folder, ENV['SE_REPORT_DIR']

    get '/' do
      redirect '/index.html'
    end

    run! if app_file == $0
  end
end
