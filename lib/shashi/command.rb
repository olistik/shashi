require_relative "command/setup"
require_relative "command/create_set"

module Shashi
  module Command

    def self.perform(arguments:)
      case arguments[:command]
      when :setup
        Setup.perform(file: arguments[:file])
      when :create_set
        CreateSet.perform(
          file: arguments[:file],
          path: arguments[:path],
          set_name: arguments[:set_name],
          force: arguments[:force]
        )
      else
        puts "Command `#{arguments[:command]}` is not recognized."
        exit 1
      end
    end

  end
end
