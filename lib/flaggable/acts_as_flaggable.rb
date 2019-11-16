module Flaggable
  module ActsAsFlaggable
    extend ActiveSupport::Concern

    included do
      has_many :flagged_items, as: :flaggable

      after_commit :flaggable_check
    end

    def flaggable_check
      self.class.columns.select do |column|
        %i[text string].include?(column.type)
      end.each do |column|
        content = send(column.name)

        next unless FlaggedItem.flagged?(content)

        flagged_items.create!(reason: 'Profane', preview: content)
      end
    end
  end
end
