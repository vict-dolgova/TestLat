class Employee < ApplicationRecord
  belongs_to :library
  validates :surname, presence: true
  validates :middleName, presence: true
  validates :position, presence: true
end
