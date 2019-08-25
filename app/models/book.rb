class Book < ApplicationRecord
  belongs_to :library
  has_many :issuances, dependent: :destroy
  has_attached_file :cover
  validates_attachment :cover,
                     content_type: { content_type: /\image\/.*\z/ },
                     size: { less_than: 1.megabyte }
  validates :name, presence: true
  validates :author, presence: true
  validates :cipher, presence: true
  validates :publishingHouse, presence: true
  validates :publishingYear, presence: true
  validates :price, presence: true
  validates :receiptDate, presence: true
end
