class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: [:show, :edit, :update]

  def index
    @questions = Question.preload(:user, :comments).order(created_at: :desc)
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      redirect_to questions_path, notice: "質問を投稿しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @question.update(question_params)
      redirect_to question_path, notice: "質問を編集しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def search
    @questions = Question.by_keyword(params[:title_search])
    respond_to do |format|
      format.turbo_stream do
        if @questions.count.zero?
          render turbo_stream: turbo_stream.update(:questions, partial: "questions/not_found")
        else
          render turbo_stream: turbo_stream.update(:questions, partial: "questions/question", collection: @questions)
        end
      end
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end

  def set_question
    @question = Question.find(params[:id])
    authorize @question
  end
end
