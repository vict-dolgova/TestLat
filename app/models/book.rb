class Book < ApplicationRecord
  belongs_to :library
  has_many :issuances, dependent: :destroy
  has_attached_file :cover
  validates_attachment :cover,
                     content_type: { content_type: /\image\/.*\z/ },
                     size: { less_than: 1.megabyte }
end
