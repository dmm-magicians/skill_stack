class OutputsController < ApplicationController
  before_action :set_output, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def dashboard
    # 累計学習日数
    @sumOfStudyDays = Output
      .where(user_id: current_user.id)
      .count('DISTINCT date')

    # スキルごとの投稿数
    gon.outputLineChartTitleLabel = '月ごとの投稿数'
    outputsForOutputLineChart = Output.all.left_joins(:skill)
      .group("output_date")
      .select("DATE_FORMAT(outputs.date, '%Y-%m') AS output_date, count(outputs.skill_id) AS output_count")
      .where(outputs: {user_id: current_user.id})
      .to_a
    gon.outputLineChartXLabel = []
    gon.outputLineChartData = []
    outputsForOutputLineChart.each { |output|
      gon.outputLineChartXLabel.push(output['output_date'])
      gon.outputLineChartData.push(output['output_count'])
    }

    # 投稿数棒グラフ
    gon.outputBarChartTitleLabel = '投稿数'
    outputsForOutputBarChart = Output.all.left_joins(:skill)
      .group('outputs.skill_id')
      .select('skills.name AS skill_name, count(outputs.skill_id) AS output_count')
      .where(outputs: {user_id: current_user.id})
      .order('output_count DESC')
      .to_a
    gon.outputBarChartXLabel = []
    gon.outputBarChartData = []
    outputsForOutputBarChart.each { |output|
      gon.outputBarChartXLabel.push(output['skill_name'])
      gon.outputBarChartData.push(output['output_count'])
    }

    # 文字数棒グラフ
    gon.wordCountBarChartTitleLabel = '学習日数'
    outputsForWordCountBarChart = Output.all.left_joins(:skill)
      .group('outputs.skill_id')
      .select('skills.name AS skill_name, count(DISTINCT outputs.date) AS output_count')
      .where(outputs: {user_id: current_user.id})
      .order('output_count DESC')
      .to_a

    gon.wordCountBarChartXLabel = []
    gon.wordCountBarChartData = []
    outputsForWordCountBarChart.each { |output|
      gon.wordCountBarChartXLabel.push(output['skill_name'])
      gon.wordCountBarChartData.push(output['output_count'])
    }

    # 時間グラフ
    gon.timeBarChartTitleLabel = '学習時間(時間)'
    outputsForTimeBarChart = Output.all.left_joins(:skill)
      .group('outputs.skill_id')
      .select('skills.name AS skill_name, sum(outputs.time) AS sum_time')
      .where(outputs: {user_id: current_user.id})
      .order('sum_time DESC')
      .to_a

    gon.timeBarChartXLabel = []
    gon.timeBarChartData = []
    outputsForTimeBarChart.each { |output|
      gon.timeBarChartXLabel.push(output['skill_name'])
      gon.timeBarChartData.push(output['sum_time'])
    }

    # 自己評価平均棒グラフ
    gon.selfAssessmentAverageBarChartTitleLabel = '自己評価平均'
    outputsForSelfAssessmentAverageBarChart = Output.all.left_joins(:skill)
      .group('outputs.skill_id')
      .select('skills.name AS skill_name, avg(outputs.self_assessment_score) AS self_assessment_score_average')
      .where(outputs: {user_id: current_user.id})
      .order('self_assessment_score_average DESC')
      .to_a

    gon.selfAssessmentAverageBarChartXLabel = []
    gon.selfAssessmentAverageBarChartData = []
    outputsForSelfAssessmentAverageBarChart.each { |output|
      gon.selfAssessmentAverageBarChartXLabel.push(output['skill_name'])
      gon.selfAssessmentAverageBarChartData.push(output['self_assessment_score_average'])
    }

  end

  # GET /outputs or /outputs.json
  def index
    @outputs = Output.order(date: "DESC").all
    @skills = current_user.skills
  end

  # GET /outputs/1 or /outputs/1.json
  def show
    @output = Output.find(params[:id])
    @skill = @output.skill
  end

  # GET /outputs/new
  def new
    @output = Output.new
    @skills = current_user.skills
  end

  # GET /outputs/1/edit
  def edit
    @output = Output.find(params[:id])
    @skills = current_user.skills
  end

  # POST /outputs or /outputs.json
  def create
    @output = Output.new(output_params)
    @output.user_id = current_user.id
    @output.date = Date.today
    if @output.save
      flash[:notice] = "投稿しました！今日も学習お疲れ様でした！！"
      redirect_to output_path(@output)
    else
      flash[:alert]
      render :new
    end
  end

  # PATCH/PUT /outputs/1 or /outputs/1.json
  def update
    if @output.update(output_params)
      flash[:notice] = "投稿を更新しました！"
      redirect_to output_path(@output)
    else
      render :edit
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
      params.require(:output).permit(:skill_id, :title, :text, :time, :self_assessment_score)
    end
end
