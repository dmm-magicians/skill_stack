class AddIndexUserIdAndSkillIdToUserSkills < ActiveRecord::Migration[5.2]
  def change
    add_index :user_skills, [:user_id, :skill_id], :unique => true
  end
end
