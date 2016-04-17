class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :borrower_id
      t.integer :book_id
      t.date :start
      t.date :end
      t.boolean :returned

      t.timestamps null: false
    end
  end
end
