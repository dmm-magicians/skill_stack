class CreateOutputs < ActiveRecord::Migration[5.2]
  def change
    create_table :outputs do |t|
      t.integer :user_id, null: false
      t.integer :skill_id, null: false
      t.string :title, null: false, default: ""
      t.text :text, null: false
      t.float :time, null: false
      t.integer :self_assessment_score, limit: 1, null: false, default: ""
      t.date :date, null: false

      t.timestamps
    end
  end
end
