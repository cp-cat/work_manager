module Scope
  extend ActiveSupport::Concern

  included do
    scope :null, ->(attribute) { where(attribute => nil) }
    scope :not_null, ->(attribute) { where.not(attribute => nil) }

    scope :today, -> { where(created_at: 0.day.ago.all_day) }
    scope :yesterday, -> { where(created_at: 1.day.ago.all_day) }
  end
end
