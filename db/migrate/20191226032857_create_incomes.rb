class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.integer :incomecategory_id
      t.integer :money    
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
