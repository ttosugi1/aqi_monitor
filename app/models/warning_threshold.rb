class WarningThreshold < ApplicationRecord
  belongs_to :user

  validates :city, presence: true, if: :valid_city?
  validates :threshold, presence: true, numericality: { greater_than_or_equal_to: 0}

  def valid_city?
    valid = AqiService.validate_city(city)
    errors.add(:city, "No station is available for #{city}") unless valid
  end
end
