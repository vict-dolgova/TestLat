class Subscriber < ApplicationRecord
  belongs_to :library
  has_many :issuances, dependent: :destroy
  validates :surname, presence: true
  validates :name, presence: true
end
