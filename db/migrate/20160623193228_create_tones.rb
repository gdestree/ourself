class CreateTones < ActiveRecord::Migration
  def change
    create_table :tones do |t|
      t.integer :reaction_id, null: false
      t.integer :user_id, null: false

      t.float :anger, null: false
      t.float :disgust, null: false
      t.float :fear, null: false
      t.float :joy, null: false
      t.float :sadness, null: false
      t.float :analytical, null: false
      t.float :confidence, null: false
      t.float :tentative, null: false
      t.float :openess, null: false
      t.float :conscientiousness, null: false
      t.float :extraversion, null: false
      t.float :agreableness, null: false
      t.float :emotional_range, null: false

      t.timestamps null: false
    end
  end
end
