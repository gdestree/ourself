class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.string :body, null: false

      t.timestamps null: false
    end
  end
end
