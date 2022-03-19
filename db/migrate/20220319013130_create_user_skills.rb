class CreateUserSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :user_skills do |t|
      t.integer :user_id, null: false, default: ""
      t.integer :skill_id, null: false, default: ""

      t.timestamps
    end
  end
end
