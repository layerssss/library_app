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

require 'test_helper'

class LoanTest < ActiveSupport::TestCase
  setup do
    @book_1 = books(:one)
    @book_2 = books(:two)
    @borrower_1 = borrowers(:one)
    @borrower_2 = borrowers(:two)
    @loan_1 = @borrower_1.loans.create! book: @book_1
  end
  test "borrowed book cannot be borrowed" do
    assert_equal false,  @borrower_2.loans.new(book: @book_1).valid?
  end

  test "returned book can be borrowed" do
    @loan_1.update_attributes! returned: true
    assert_equal true, @borrower_2.loans.new(book: @book_1).valid?
  end

  test "destroying borrowers should set the book available to be borrowed" do
    @borrower_1.destroy!
    assert_equal true, @borrower_2.loans.new(book: @book_1).valid?
  end
end
