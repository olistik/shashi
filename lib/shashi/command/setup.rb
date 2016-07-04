require "fileutils"

module Shashi
  module Command
    module Setup

      def self.perform(file:)
        prepare_directory(file: file)
        Utils.write_database(file: file, data: {})
      end

      private

        def self.prepare_directory(file:)
          dirname = File.dirname(file)
          if File.exists?(dirname)
            if File.directory?(dirname)
              # ok
            else
              puts "You specified #{dirname} as a directory but a file with that name already exists."
              exit 1
            end
          else
            FileUtils.mkdir_p(dirname)
          end
        end

    end
  end
end
