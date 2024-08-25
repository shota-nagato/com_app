class Questions::SolveController < ApplicationController
  before_action :authenticate_user!

  def update
    @question = current_user.questions.find(params[:question_id])
    @question.update!(solved_at: Time.current)
    redirect_to question_path, notice: "質問を解決済みにしました"
  end
end
