class AddCreatedDayToReactions < ActiveRecord::Migration
  def change
    add_column :reactions, :created_day, :date
  end
end
