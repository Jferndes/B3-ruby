class CreateStepEntries < ActiveRecord::Migration[7.2]
  def change
    create_table :step_entries do |t|
      t.integer :steps, null: false
      t.date :date, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :step_entries, [:user_id, :date], unique: true
  end
end