class CreatePromptTags < ActiveRecord::Migration
  def change
    create_table :prompt_tags do |t|
      t.integer :tag_id, null: false
      t.integer :prompt_id, null: false

      t.timestamps null: false
    end
  end
end
