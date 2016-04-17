class CreateBorrowers < ActiveRecord::Migration
  def change
    create_table :borrowers do |t|
      t.string :code
      t.string :name

      t.timestamps null: false
    end
  end
end
