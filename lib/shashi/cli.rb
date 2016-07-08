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
        index: nil,
        count: 1,
      }

      opt_parser = OptionParser.new do |opts|
        opts.banner = "Usage: shashi [options]"

        opts.on("--setup", "Creates the storage file with an empty set.") do
          arguments[:command] = :setup
        end

        opts.on("--file FILE", "Uses FILE as the desired file path for the storage. Defaults to `./shashi__db.json`.") do |file|
          arguments[:file] = file
        end

        opts.on("--path PATH", "`PATH := List<KEY>[separator:.]`. Address the document's item by chaining a list of keys. For example: `key1.key2.key3`.") do |path|
          arguments[:path] = path.split(".")
        end

        opts.on("--create-set NAME", "Creates an empty set. Asks for confirmation if the key NAME already exists.") do |name|
          arguments[:command] = :create_set
          arguments[:set_name] = name
        end

        opts.on("--set KEY:VALUE", "Sets the KEY to VALUE. Asks for confirmation if the key NAME already exists. If no VALUE is given, prompts for it.") do |pair|
          arguments[:command] = :set_set
          arguments[:key], arguments[:value] = pair.split(":")
        end

        opts.on("--show KEYS", "`KEYS := List<KEY>[separator:,]`. Shows the values associated with keys but not the content of sets/lists. For example: `name,e-mail`.") do |keys|
          arguments[:command] = :show_keys
          arguments[:keys] = keys.split(",")
        end

        opts.on("--delete KEY", "Deletes the item. Asks for confirmation if it's a non-empty set or list.") do |key|
          arguments[:command] = :delete
          arguments[:key] = key
        end

        opts.on("--create-list NAME", "Creates an empty list. Asks for confirmation if the key NAME already exists.") do |name|
          arguments[:command] = :create_list
          arguments[:list_name] = name
        end

        opts.on("--index INDEX", Integer, "`INDEX := (Integer >= 0)`. References the n-th element of a list. Defaults to the size of the list (ie: the last element).") do |index|
          arguments[:index] = index
        end

        opts.on("--count COUNT", Integer, "`COUNT := (Integer > 0), defaults to 1`.") do |count|
          arguments[:count] = count
        end

        opts.on("--list-push VALUES", "`VALUES := List<VALUE>[separator:,]`. Push VALUES into a list.") do |values|
          arguments[:command] = :list_push
          arguments[:values] = values.split(",")
        end

        opts.on("--list-show", "Shows `COUNT` elements of a list, starting from `INDEX`.") do
          arguments[:command] = :list_show
        end

        end

        opts.on("--deep", "Shows the values associated with KEYS (recursively) even if they contain sets or lists.") do
          arguments[:deep] = true
        end

        opts.on("--no-echo", "When prompted for a value, doesn't show it while typing.") do
          arguments[:echo] = false
        end

        opts.on("--force", "Doesn't ask for confirmation.") do
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

      if arguments[:index] && arguments[:index] < 0
        puts "`INDEX` must be greater than or equal to 0."
        puts opt_parser
        exit 1
      end

      if arguments[:count] <= 0
        puts "`COUNT` must be greater than 0."
        puts opt_parser
        exit 1
      end

      arguments[:file] = File.expand_path(arguments[:file])

      Command.perform(arguments: arguments)
    end

  end
end
