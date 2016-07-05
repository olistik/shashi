require "pp"

module Shashi
  module Command
    module ShowKeys

      def self.perform(file:, path:, keys:, deep:)
        data = Utils.read_database(file: file)
        data_reference = Utils.data_walker(data: data, path: path)
        keys.each do |key|
          if data_reference.has_key?(key)
            value = data_reference[key]
            print "#{key}: "
            if Utils::Data.is_list?(value)
              if deep
                pp value
              else
                puts ""
                puts "#List#"
              end
            elsif Utils::Data.is_set?(value)
              if deep
                puts ""
                pp value
              else
                puts "#Set#"
              end
            else
              puts value
            end
          else
            puts "NOT FOUND: #{key}"
          end
        end
      end

    end
  end
end
