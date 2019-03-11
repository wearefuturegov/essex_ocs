class Response < ApplicationRecord
  validates :participant_number, presence: true
end
