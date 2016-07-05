require "io/console"

module Shashi
  module Command
    module SetSet

      def self.perform(file:, path:, key:, value:, force:, echo:)
        data = Utils::Database.read_database(file: file)
        data_reference = Utils::Data.walk(data: data, path: path)
        if data_reference.has_key?(key)
          if force
            update_data(file: file, data: data, data_reference: data_reference, key: key, value: value, echo: echo)
          else
            print "The key #{key} already exists at #{path.join(".")}, overwrite? [y/N] "
            choice = gets
            case choice.strip
            when "y"
              update_data(file: file, data: data, data_reference: data_reference, key: key, value: value, echo: echo)
            when ""
              # do nothing
            when "N"
              # do nothing
            else
              puts "Choice not understood, ignoring."
            end
          end
        else
          update_data(file: file, data: data, data_reference: data_reference, key: key, value: value, echo: echo)
        end
      end

      private

        def self.update_data(file:, data:, data_reference:, key:, value:, echo:)
          data_reference[key] = if value
            value
          else
            print "[#{key}] = "
            if echo
              gets.strip
            else
              STDIN.noecho(&:gets).strip
            end
          end
          Utils::Database.write_database(file: file, data: data)
        end

    end
  end
end
