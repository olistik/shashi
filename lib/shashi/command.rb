require_relative "command/setup"
require_relative "command/create_set"
require_relative "command/set_set"
require_relative "command/list_keys"
require_relative "command/show_keys"
require_relative "command/set_delete"
require_relative "command/create_list"
require_relative "command/list_push"
require_relative "command/list_show"
require_relative "command/list_delete"
require_relative "command/query"

module Shashi
  module Command

    def self.perform(arguments:)
      case arguments[:command]
      when :setup
        Setup.perform(file: arguments[:file])
      when :create_set
        CreateSet.perform(
          file: arguments[:file],
          path: arguments[:path],
          set_name: arguments[:set_name],
          force: arguments[:force]
        )
      when :set_set
        SetSet.perform(
          file: arguments[:file],
          path: arguments[:path],
          key: arguments[:key],
          value: arguments[:value],
          force: arguments[:force],
          echo: arguments[:echo]
        )
      when :list_keys
        ListKeys.perform(
          file: arguments[:file],
          path: arguments[:path],
        )
      when :show_keys
        ShowKeys.perform(
          file: arguments[:file],
          path: arguments[:path],
          keys: arguments[:keys],
          deep: arguments[:deep],
        )
      when :delete
        SetDelete.perform(
          file: arguments[:file],
          path: arguments[:path],
          key: arguments[:key],
          force: arguments[:force],
        )
      when :create_list
        CreateList.perform(
          file: arguments[:file],
          path: arguments[:path],
          list_name: arguments[:list_name],
          force: arguments[:force]
        )
      when :list_push
        ListPush.perform(
          file: arguments[:file],
          path: arguments[:path],
          values: arguments[:values],
          index: arguments[:index]
        )
      when :list_show
        ListShow.perform(
          file: arguments[:file],
          path: arguments[:path],
          index: arguments[:index],
          count: arguments[:count]
        )
      when :list_delete
        ListDelete.perform(
          file: arguments[:file],
          path: arguments[:path],
          index: arguments[:index],
          count: arguments[:count]
        )
      when :query
        Query.perform(
          file: arguments[:file],
          query: arguments[:query]
        )
      else
        puts "Command `#{arguments[:command]}` is not recognized."
        exit 1
      end
    end

  end
end
