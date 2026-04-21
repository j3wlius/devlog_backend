class CreateEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :entries do |t|
      t.string :title
      t.text :work_done
      t.text :learnings
      t.text :blockers
      t.string :mood
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
