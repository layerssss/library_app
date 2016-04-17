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

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "the code of book should default to the next successive code" do
    book_1 = Book.create! code: "CODE1"
    book_2 = Book.create!
    book_3 = Book.create!
    book_19 = Book.create! code: 'CODE19'
    book_20 = Book.create!
    book_99 = Book.create! code: 'CODE99'
    book_100 = Book.create!
    assert_equal 'CODE2', book_2.code
    assert_equal 'CODE3', book_3.code
    assert_equal 'CODE20', book_20.code
    assert_equal 'CODE100', book_100.code
  end
end
