class ChangeDataSelfAssessmentScoreToOutputs < ActiveRecord::Migration[5.2]
  def change
    change_column :outputs, :self_assessment_score, :float
  end
end
