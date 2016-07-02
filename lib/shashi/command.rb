require "fileutils"
require "json"

module Shashi
  module Command
    def self.perform(arguments:)
      case arguments[:command]
      when :setup
        setup(file: arguments[:file])
      else
        puts "Command `#{arguments[:command]}` is not recognized."
        exit 1
      end
    end

    private

      def self.setup(file:)
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
        File.write(file, JSON.pretty_generate({}))
      end
  end
end
