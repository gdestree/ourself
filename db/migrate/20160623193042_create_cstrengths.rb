class CreateCstrengths < ActiveRecord::Migration
  def change
    create_table :cstrengths do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :concepts, null: false
      t.integer :tag_id, null: false
      t.string :exercise1, null: false
      t.string :exercise2, null: false
      t.string :motto, null: false

      t.timestamps null: false
    end
  end
end

