class UserSkillsController < ApplicationController

  # POST /user_skills or /user_skills.json
  def create
    
    @user_skill = UserSkill.new(user_skill_params)
    if @user_skill.save
      redirect_to skills_edit_path, notice: "保存に成功しました"
    else
      redirect_to skill_edit_path
    end
    
  end

  private
    # Only allow a list of trusted parameters through.
    def user_skill_params
      params.require(:user_skill).permit(:user_id, :skill_id)
    end
end
