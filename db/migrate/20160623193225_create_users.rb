class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :email, null: false
      t.string :phone_number
      t.string :password_digest, null: false
      t.integer :email_reminders, null: false, default: 0
      t.integer :text_reminders, null: false, default: 0

      t.timestamps null: false
    end
  end
end
