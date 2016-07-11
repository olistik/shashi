module Shashi
  module Command
    module ListKeys

      def self.perform(file:, path:)
        data = Utils::Database.read_database(file: file)
        data_reference = Utils::Data.walk(data: data, path: path)
        if Utils::Data.is_set?(data_reference)
          puts "#{path.join(".")}.keys = ["
          data_reference.each do |key, value|
            value_type = if Utils::Data.is_list?(value)
              "#List#"
            elsif Utils::Data.is_set?(value)
              "#Set#"
            else
              "#Scalar#"
            end
            puts "\t- #{key}: #{value_type}"
          end
          puts "]"
        else
          puts "Path `#{path.join(".")}` doesn't lead to a set."
          exit 1
        end
      end

    end
  end
end
