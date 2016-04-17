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

require 'test_helper'

class BorrowerTest < ActiveSupport::TestCase
  test "the code of borrower should default to the next successive code" do
    borrower_1 = Borrower.create! code: "CODE1"
    borrower_2 = Borrower.create!
    borrower_3 = Borrower.create!
    borrower_19 = Borrower.create! code: 'CODE19'
    borrower_20 = Borrower.create!
    borrower_99 = Borrower.create! code: 'CODE99'
    borrower_100 = Borrower.create!
    assert_equal 'CODE2', borrower_2.code
    assert_equal 'CODE3', borrower_3.code
    assert_equal 'CODE20', borrower_20.code
    assert_equal 'CODE100', borrower_100.code
  end
end
