class ChangeQuestionAnswerToIdBleh < ActiveRecord::Migration
  def change
    rename_column :questions, :question, :question_id

    rename_column :questions, :answer, :answer_id
  end
end
