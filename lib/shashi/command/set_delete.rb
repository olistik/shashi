require "io/console"

module Shashi
  module Command
    module SetDelete

      def self.perform(file:, path:, key:, force:)
        data = Utils.read_database(file: file)
        data_reference = Utils.data_walker(data: data, path: path)
        if data_reference.has_key?(key)
          if force
            update_data(file: file, data: data, data_reference: data_reference, key: key)
          else
            value = data_reference[key]
            if Utils::Data.is_list?(value)
              if confirms_deletion?(key: key, path: path, value_type: "#List#")
                update_data(file: file, data: data, data_reference: data_reference, key: key)
              end
            elsif Utils::Data.is_set?(value)
              if confirms_deletion?(key: key, path: path, value_type: "#Set#")
                update_data(file: file, data: data, data_reference: data_reference, key: key)
              end
            else
              update_data(file: file, data: data, data_reference: data_reference, key: key)
            end
          end
        else
          puts "There is no key `#{key}` at `#{path.join(".")}`"
        end
      end

      private

        def self.confirms_deletion?(key:, path:, value_type:)
          print "The key `#{key}` at `#{path.join(".")}` contains a `#{value_type}`, confirm deletion? [y/N] "
          choice = gets.strip
          case choice
          when "y"
            true
          when ""
            # do nothing
            false
          when "N"
            # do nothing
            false
          else
            puts "Choice not understood, ignoring."
            false
          end
        end

        def self.update_data(file:, data:, data_reference:, key:)
          data_reference.delete(key)
          Utils.write_database(file: file, data: data)
        end

    end
  end
end
