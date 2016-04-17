class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :code
      t.string :title
      t.string :author
      t.boolean :returned, default: true

      t.timestamps null: false
    end
  end
end
