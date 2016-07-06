module Shashi
  module Command
    module CreateList

      def self.perform(file:, path:, list_name:, force:)
        data = Utils::Database.read_database(file: file)
        data_reference = Utils::Data.walk(data: data, path: path)
        if data_reference.has_key?(list_name)
          if force
            update_data(file: file, data: data, data_reference: data_reference, list_name: list_name)
          else
            print "The key #{list_name} already exists at #{path.join(".")}, overwrite? [y/N] "
            choice = gets
            case choice.strip
            when "y"
              update_data(file: file, data: data, data_reference: data_reference, list_name: list_name)
            when ""
              # do nothing
            when "N"
              # do nothing
            else
              puts "Choice not understood, ignoring."
            end
          end
        else
          update_data(file: file, data: data, data_reference: data_reference, list_name: list_name)
        end
      end

      private

        def self.update_data(file:, data:, data_reference:, list_name:)
          data_reference[list_name] = []
          Utils::Database.write_database(file: file, data: data)
        end

    end
  end
end
