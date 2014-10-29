class SeleniumReporter

  class ConfigChecker

    def initialize
      output_dir_check
    end

    private

      ERRORS = { NoOutputDirSpecified: 'You need to specify an output directory (e.g., SE_OUTPUT_DIR).' }

      def output_dir_check
        if ENV['SE_OUTPUT_DIR'].nil?
          raise ERRORS[:NoOutputDirSpecified]
        end
      end

  end
end
