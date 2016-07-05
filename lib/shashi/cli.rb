require "optparse"

module Shashi
  module CLI

    def self.perform(options:)
      arguments = {
        file: "./shashi__db.json",
        path: [],
        force: false,
        echo: true,
        deep: false,
      }

      opt_parser = OptionParser.new do |opts|
        opts.banner = "Usage: shashi [options]"

        opts.on("--setup", "Creates the storage file with an empty set") do
          arguments[:command] = :setup
        end

        opts.on("--file FILE", "Choose the storage file") do |file|
          arguments[:file] = file
        end

        opts.on("--path PATH", "PATH := List<KEY>[separator:.], applies a partial matching but raise an error in case of more than one match") do |path|
          arguments[:path] = path.split(".")
        end

        opts.on("--create-set NAME", "Creates an empty set") do |name|
          arguments[:command] = :create_set
          arguments[:set_name] = name
        end

        opts.on("--set KEY:VALUE", "Sets a key with the given value") do |pair|
          arguments[:command] = :set_set
          arguments[:key], arguments[:value] = pair.split(":")
        end

        opts.on("--show KEYS", "`KEYS := List<KEY>[separator:,]`. Shows the values associated with keys but not the content of sets/lists. For example: `name,e-mail`.") do |keys|
          arguments[:command] = :show_keys
          arguments[:keys] = keys.split(",")
        end

        opts.on("--deep", "Shows the values associated with KEYS (recursively) even if they contain sets or lists.") do
          arguments[:deep] = true
        end

        opts.on("--no-echo", "When prompted for a value, doesn't show it while typing.") do
          arguments[:echo] = false
        end

        opts.on("--force", "Doesn't ask for confirmation") do
          arguments[:force] = true
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
