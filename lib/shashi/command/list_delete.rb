module Shashi
  module Command
    module ListDelete

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
              puts "Starting from index `#{index}` you can delete to a maximum of `#{data_reference.count - index}`."
              exit 1
            end
          else
            index = 0;
          end
          data_reference.reject!.with_index do |value, i|
            i >= index && i < index + count
          end
          Utils::Database.write_database(file: file, data: data)
        else
          puts "Path `#{path.join(".")}` doesn't lead to a list."
          exit 1
        end
      end

    end
  end
end
