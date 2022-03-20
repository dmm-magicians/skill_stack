class SkillsController < ApplicationController

  before_action :authenticate_user!
  # GET /skills/edit
  def edit
    # @user_skills = UserSkill.where(user_id: current_user.id).select(:skill_id).distinct

    # @user_skills = current_user.user_skills.select(:skill_id)
    # @skills = []
    # for @user_skill in @user_skills
    #   @skill = Skill.find(@user_skill.skill_id)
    #   @skills.push(@skill)
    # end
    @all_skills = Skill.all
    @user_skills = current_user.skills.select(:name, :image)
    @new_user_skill = UserSkill.new
  end

  private
    # Only allow a list of trusted parameters through.
    def skill_params
      params.require(:skill).permit(:string, :text)
    end
end
