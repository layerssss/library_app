# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  title      :string(255)
#  author     :string(255)
#  returned   :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Book < ActiveRecord::Base
  validates_presence_of :code
  validates_uniqueness_of :code

  has_many :loans, dependent: :destroy
  has_one :outstanding_loan, -> { where returned: false }, class_name: :Loan
  has_one :borrower, through: :outstanding_loan

  scope :available, -> {
    where returned: true
  }

  after_initialize do
    self.code ||= begin
      if (last_code = Book.last.try :code) && (match = /\d+$/.match(last_code))
        digits = match.to_s
        "#{last_code[0...(0 - digits.size)]}#{(digits.to_i + 1).to_s.rjust digits.size, '0'}"
      end
    end
  end

  def to_s
    "#{self.code}: #{self.title}"
  end
end
