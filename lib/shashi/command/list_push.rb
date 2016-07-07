module Shashi
  module Command
    module ListPush

      def self.perform(file:, path:, values: [], index: -1)
        data = Utils::Database.read_database(file: file)
        data_reference = Utils::Data.walk(data: data, path: path)
        if Utils::Data.is_list?(data_reference)
          if index
            if data_reference.count <= index
              puts "The index `#{index}` is too high, the highest possible index for this list is currently `#{data_reference.count - 1}`."
              exit 1
            end
          else
            index = -1;
          end
          data_reference.insert(index, *values)
          Utils::Database.write_database(file: file, data: data)
        else
          puts "Path `#{path.join(".")}` doesn't lead to a list."
          exit 1
        end
      end

    end
  end
end
