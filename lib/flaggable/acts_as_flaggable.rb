module Flaggable
  module ActsAsFlaggable
    extend ActiveSupport::Concern

    included do
      has_many :flagged_items, class_name: 'Flaggable::FlaggedItem', as: :flaggable

      after_commit :flaggable_check
    end

    def flaggable_check
      self.class.columns.select do |column|
        %i[text string].include?(column.type)
      end.each do |column|
        filter = Flaggable::Filter.new(send(column.name))

        next unless filter.match?

        flagged_items.create!(reason: 'Profane', preview: filter.sample)
      end
    end
  end
end
