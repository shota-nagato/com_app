class QuestionsController < ApplicationController
  def index
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      redirect_to questions_path, notice: "質問を投稿しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
