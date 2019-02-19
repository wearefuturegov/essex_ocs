class Response < ApplicationRecord
  validates :surname, presence: true
  validates :forename, presence: true
end
