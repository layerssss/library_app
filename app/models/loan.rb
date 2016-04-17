# == Schema Information
#
# Table name: loans
#
#  id          :integer          not null, primary key
#  borrower_id :integer
#  book_id     :integer
#  start       :date
#  end         :date
#  returned    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Loan < ActiveRecord::Base
  belongs_to :book
  belongs_to :borrower

  validates_presence_of :book_id, :borrower_id, :start, :end

  after_initialize do
    self.start ||= Date.today
    self.end ||= 3.weeks.from_now
    self.returned ||= false
  end


  after_save do
    if self.returned_changed?
      self.book.update_attributes! returned: self.returned
    end
  end

  after_destroy do
    self.book.update_attributes! returned: true unless self.returned
  end

  validate :book_id do
    if self.new_record? && self.book
      unless self.book.returned
        self.errors.add :book_id, "is not available at this moment."
      end
    end
  end
  validate :end do
    unless self.end > self.start
      self.errors.add :end, "must be after a date after #{self.start}"
    end
  end
end
