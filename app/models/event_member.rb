class EventMember < ApplicationRecord
  # Event relationship validations
  belongs_to :member
  belongs_to :event
end
