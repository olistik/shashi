module Shashi
  module Command
    module ListShow

      def self.perform(file:, path:, index: 0, count: 1)
        data = Utils::Database.read_database(file: file)
        data_reference = Utils::Data.walk(data: data, path: path)
        if Utils::Data.is_list?(data_reference)
          if index
            if data_reference.count <= index
              puts "The index `#{index}` is too high, the highest possible index for this list is currently `#{data_reference.count - 1}`."
              exit 1
            end
            if data_reference.count < index + count
              puts "Starting from index `#{index}` you can access to a maximum of `#{data_reference.count - index}`."
              exit 1
            end
          else
            index = 0;
          end
          range_string = if index == index + count - 1
            index
          else
            "#{index}-#{index + count}"
          end
          puts "`#{path.join(".")}`[#{range_string}]:"
          data_reference[index..(index + count - 1)].each do |item|
            content = if Utils::Data.is_list?(item)
              "#List#"
            elsif Utils::Data.is_set?(item)
              "#Set#"
            else
              item
            end
            puts "- #{content}"
          end
        else
          puts "Path `#{path.join(".")}` doesn't lead to a list."
          exit 1
        end
      end

    end
  end
end
