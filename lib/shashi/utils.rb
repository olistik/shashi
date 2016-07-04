require "json"

module Shashi
  module Utils

    def self.blank?(value)
      value == "" || value == nil
    end

    def self.write_database(file:, data:)
      File.write(path, JSON.pretty_generate(data))
    end

  end
end
