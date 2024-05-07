class Event < ApplicationRecord
  # Event name validations
  validates :name, presence: true

  # Event description validations
  validates :description, presence: true

  # Event start validations
  validates :start, presence: true
  validates :start, comparison: { less_than: :end, message: "Can't start before end" }
  validates :start, comparison: { greater_than_or_equal_to: DateTime.now, message: "Can't start in the past" }

  # Event end validations
  validates :end, presence: true
  validates :end, comparison: { greater_than: :start, message: "Can't end before start" }
end
