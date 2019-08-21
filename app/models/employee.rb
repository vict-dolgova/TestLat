class Employee < ApplicationRecord
  belongs_to :library
  validates :surname, presence: true
  validates :name, presence: true
  validates :position, presence: true
end
