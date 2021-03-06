module Flaggable
  class FlaggedItem < ActiveRecord::Base
    enum status: { undecided: 0, escalated: 1, dismissed: 2 }

    belongs_to :flaggable, polymorphic: true
  end
end
