module Shashi
  module Command
    module CreateSet

      def self.perform(file:, path:, set_name:, force:)
        data = Utils.read_database(file: file)
        data_reference = traverse_by_path(data: data, path: path)
        if data_reference.has_key?(set_name)
          if force
            update_data(file: file, data: data, data_reference: data_reference, set_name: set_name)
          else
            print "The key #{set_name} already exists at #{path.join(".")}, overwrite? [y/N] "
            choice = gets
            case choice.strip
            when "y"
              update_data(file: file, data: data, data_reference: data_reference, set_name: set_name)
            when ""
              # do nothing
            when "N"
              # do nothing
            else
              puts "Choice not understood, ignoring."
            end
          end
        else
          update_data(file: file, data: data, data_reference: data_reference, set_name: set_name)
        end
      end

      private

        def self.update_data(file:, data:, data_reference:, set_name:)
          data_reference[set_name] = {}
          Utils.write_database(file: file, data: data)
        end

        def self.traverse_by_path(data:, path:)
          current = data
          path.each do |key|
            current = current[key]
          end
          current
        end

    end
  end
end
