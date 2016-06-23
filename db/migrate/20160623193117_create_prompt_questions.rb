class CreatePromptQuestions < ActiveRecord::Migration
  def change
    create_table :prompt_questions do |t|
      t.integer :question_id, null: false
      t.integer :prompt_id, null: false

      t.timestamps null: false
    end
  end
end
