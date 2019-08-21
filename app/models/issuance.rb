class Issuance < ApplicationRecord
  belongs_to :book
  belongs_to :subscriber
end
