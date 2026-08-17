class AddGoalAmountToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :goal_amount, :integer
  end
end
