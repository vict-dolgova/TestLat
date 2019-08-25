class Subscriber < ApplicationRecord
  belongs_to :library
  has_many :issuances, dependent: :destroy
  validates :ticketnumber, presence: true
  validates :surname, presence: true
  validates :name, presence: true
  validates :address, presence: true
end
