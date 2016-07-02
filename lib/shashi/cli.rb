require "optparse"

module Shashi
  module CLI

    def self.perform(options:)
      arguments = {
        file: "./shashi__db.json",
        path: [],
      }

      opt_parser = OptionParser.new do |opts|
        opts.banner = "Usage: shashi [options]"

        opts.on("--setup", "Creates the storage file with an empty set") do
          arguments[:command] = :setup
        end

        opts.on("--file FILE", "Choose the storage file") do |file|
          arguments[:file] = file
        end

        opts.on("-h", "--help", "Prints this help") do
          puts opts
          exit
        end
      end

      opt_parser.parse!(options)

      if Utils.blank?(arguments[:command])
        puts opt_parser
        exit 1
      end

      arguments[:file] = File.expand_path(arguments[:file])

      Command.perform(arguments: arguments)
    end

  end
end
