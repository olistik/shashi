require "fileutils"
require "json"
require_relative "command/setup"

module Shashi
  module Command

    def self.perform(arguments:)
      case arguments[:command]
      when :setup
        Setup.perform(file: arguments[:file])
      else
        puts "Command `#{arguments[:command]}` is not recognized."
        exit 1
      end
    end

  end
end
