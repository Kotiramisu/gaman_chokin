class CreateSavings < ActiveRecord::Migration[7.2]
  def change
    create_table :savings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.integer :amount
      t.date :saved_at

      t.timestamps
    end
  end
end
