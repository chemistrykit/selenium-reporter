class SeleniumReporter
  module System
    module Folder

      extend self

      def prepare
        unless exists?
          create!
        else
          clean!
        end
      end

      private

        def exist?
          File.directory?(ENV['SE_OUTPUT_DIR'])
        end

        def exists?
          !Dir.glob(ENV['SE_OUTPUT_DIR'] + '/*').empty?
        end

        def create!
          FileUtils.mkdir_p(ENV['SE_OUTPUT_DIR'])
          FileUtils.mkdir_p(ENV['SE_OUTPUT_DIR'] + '/screenshot')
          FileUtils.mkdir_p(ENV['SE_OUTPUT_DIR'] + '/xml')
          FileUtils.mkdir_p(ENV['SE_OUTPUT_DIR'] + '/report')
        end

        def empty?
          Dir.glob("#{ENV['SE_OUTPUT_DIR']}/*").empty?
        end

        def empty!
          FileUtils.rm_rf Dir.glob("#{ENV['SE_OUTPUT_DIR']}/*")
        end

        def clean!
          empty!
          create!
        end

    end
  end
end
