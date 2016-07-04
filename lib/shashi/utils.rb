require "json"

module Shashi
  module Utils

    def self.blank?(value)
      value == "" || value == nil
    end

    def self.read_database(file:)
      JSON.parse(File.read(file))
    end

    def self.write_database(file:, data:)
      File.write(file, JSON.pretty_generate(data))
    end

    def self.data_walker(data:, path:)
      current = data
      path.each do |key|
        current = current[key]
      end
      current
    end

  end
end
