class CreateToDos < ActiveRecord::Migration[8.0]
  def change
    create_table :to_dos do |t|
      t.string :title
      t.datetime :due_on
      t.references :notify, index: true, null: false, foreign_key: {to_table: :users}
      t.string :notes
      t.references :added_by, index: true, null: false, foreign_key: {to_table: :users}
      t.references :assigned_to, index: true, null: false, foreign_key: {to_table: :users}
      t.datetime :date_completed

      t.timestamps
    end
  end
end
