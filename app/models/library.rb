class Library < ApplicationRecord
  has_many :employees, dependent: :destroy
  has_many :books, dependent: :destroy
  has_many :subscribers, dependent: :destroy
  validates :number, presence: true
  validates :name, presence: true, length: { minimum: 5 }
  validates :address, presence: true, length: { minimum: 5 }
end
