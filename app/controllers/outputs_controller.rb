class OutputsController < ApplicationController
  before_action :set_output, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def dashboard
    gon.xLabel = ['Ruby', 'PHP', 'AWS', 'Azure', 'GCP', 'Rails']
    gon.titleLabel = '投稿数'
    gon.data = [120, 19, 3, 50, 2, 3]

    # 投稿数棒グラフ
    gon.outputBarChartTitleLabel = '投稿数'

    # 文字数棒グラフ
    gon.wordCountBarChartTitleLabel = '投稿文字数'

    # 時間グラフ
    gon.timeBarChartTitleLabel = '学習時間'

    # 自己評価平均棒グラフ
    gon.selfAssessmentAverageBarChartTitleLabel = '自己評価平均'


  end

  # GET /outputs or /outputs.json
  def index
    @outputs = Output.all
  end

  # GET /outputs/1 or /outputs/1.json
  def show
  end

  # GET /outputs/new
  def new
    @output = Output.new
    @skills = current_user.skills
  end

  # GET /outputs/1/edit
  def edit
  end

  # POST /outputs or /outputs.json
  def create
    @output = Output.new(output_params)
    respond_to do |format|
      if @output.save
        format.html { redirect_to output_url(@output), notice: "Output was successfully created." }
        format.json { render :show, status: :created, location: @output }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @output.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outputs/1 or /outputs/1.json
  def update
    respond_to do |format|
      if @output.update(output_params)
        format.html { redirect_to output_url(@output), notice: "Output was successfully updated." }
        format.json { render :show, status: :ok, location: @output }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @output.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outputs/1 or /outputs/1.json
  # def destroy
  #   @output.destroy

  #   respond_to do |format|
  #     format.html { redirect_to outputs_url, notice: "Output was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_output
      @output = Output.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def output_params
      params.require(:output).permit(:user_id, :skill_id, :title, :text, :time, :self_assessment_score, :date)
    end
end
