require "pp"

module Shashi
  module Command
    module Query

      # mapping: build a query string for each item in the database
      # partial matching: perform a partial match of the query against the mapping
      # based on `all` and `deep` shows the results

      # examples:
      # de.goo.mail=mauri>*
      # de.goo.mail=mauri>* --deep
      # face>mail --all
      # goo.tfa[3]
      # goo.tfa.id=3>val
      # goo>*
      def self.perform(file:, query:, all: false, deep: false)
        data = Utils::Database.read_database(file: file)

        
      end

    end
  end
end
