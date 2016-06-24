class CreateReactions < ActiveRecord::Migration
  def change
    create_table :reactions do |t|
      t.integer :cstrength_id, null: false
      t.integer :user_id, null: false
      t.float :sentiment_rating, null: false, default: 0.0

      t.timestamps null: false
    end
  end
end
