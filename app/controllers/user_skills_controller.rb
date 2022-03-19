class UserSkillsController < ApplicationController

  # POST /user_skills or /user_skills.json
  def create
    @user_skill = UserSkill.new(user_skill_params)

    respond_to do |format|
      if @user_skill.save
        format.html { redirect_to user_skill_url(@user_skill), notice: "User skill was successfully created." }
        format.json { render :show, status: :created, location: @user_skill }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_skill_params
      params.require(:user_skill).permit(:int, :int)
    end
end
