class Questions::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question
  before_action :set_comments, only: [:index, :create]

  def index
    render "comments/index"
  end

  def new
    @comment = @question.comments.build(user: current_user)
    render "comments/new"
  end

  def create
    @comment = @question.comments.build(comment_params.merge(user: current_user))
    if @comment.save
      flash.now[:notice] = "コメントしました。"
      @new_comment = @question.comments.build(user: current_user)
      respond_to do |format|
        format.turbo_stream { render "comments/create" }
      end
    else
      render "comments/new"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_comments
    @comments = @question.comments.preload!(user: {avatar_attachment: :blob}).order(:created_at)
  end
end
