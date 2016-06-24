class CreateCstrengthsQuestions < ActiveRecord::Migration
  def change
    create_table :cstrengths_questions do |t|
      t.integer :question_id, null: false
      t.integer :cstrengths_id, null: false

      t.timestamps null: false
    end
  end
end
