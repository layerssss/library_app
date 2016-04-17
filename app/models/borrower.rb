# == Schema Information
#
# Table name: borrowers
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Borrower < ActiveRecord::Base
  validates_presence_of :code
  validates_uniqueness_of :code
  
  has_many :loans, dependent: :destroy

  after_initialize do
    self.code ||= begin
      if (last_code = Borrower.last.try :code) && (match = /\d+$/.match(last_code))
        digits = match.to_s
        "#{last_code[0...(0 - digits.size)]}#{(digits.to_i + 1).to_s.rjust digits.size, '0'}"
      end
    end
  end

  def to_s
    "#{self.code}: #{self.name}"
  end
end
