class WarningThreshold < ApplicationRecord
  belongs_to :user

  validates :city, presence: true
  validates :threshold, presence: true, numericality: { greater_than_or_equal_to: 0}
end
