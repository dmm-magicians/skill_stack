class CreateOutputs < ActiveRecord::Migration[5.2]
  def change
    create_table :outputs do |t|
      t.integer :user_id, null: false, default: ""
      t.integer :skill_id, null: false, default: ""
      t.string :title, null: false, default: ""
      t.text :text, null: false, default: ""
      t.float :time, null: false, default: ""
      t.integer :self_assessment_score, limit: 1, null: false, default: ""
      t.date :date, null: false, default: ""

      t.timestamps
    end
  end
end
