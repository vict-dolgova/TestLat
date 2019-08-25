class Issuance < ApplicationRecord
  belongs_to :book
  belongs_to :subscriber
  validates :subscriber_id, presence: true
  validates :issueDate, presence: true
  validates :returnDate, presence: true

  validate :returnDate_before_issueDate
  validate :issueDate_before_last_returnDate

  def returnDate_before_issueDate
    if issueDate && returnDate
      errors.add(:returnDate, "Error returnDate") if returnDate < issueDate
    end
  end

  def issueDate_before_last_returnDate
    if issueDate
      @last = Issuance.where(book_id: book_id).order(:returnDate).last
      if @last
        errors.add(:issueDate, "Error issueDate") if issueDate < @last.returnDate
      end
    end
  end

end
