class StepEntry < ApplicationRecord
  belongs_to :user
  
  validates :steps, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :date, presence: true
end