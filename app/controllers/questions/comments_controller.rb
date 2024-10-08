class Questions::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: [:index, :new, :update, :create]
  before_action :set_comments, only: [:index, :create]
  before_action :set_comment, only: [:edit, :update]

  def index
    render "comments/index"
  end

  def new
    @comment = @question.comments.build(user: current_user)
    render "comments/new"
  end

  def edit
    render "comments/edit"
  end

  def create
    @comment = @question.comments.build(comment_params.merge(user: current_user))
    if @comment.save
      flash.now.notice = "コメントを投稿しました。"
      @new_comment = @question.comments.build(user: current_user)
      respond_to do |format|
        format.turbo_stream { render "comments/create" }
      end
    else
      render "comments/new"
    end
  end

  def update
    if @comment.update(comment_params)
      flash.now.notice = "コメントを編集しました。"
      respond_to do |format|
        format.turbo_stream { render "comments/update" }
      end
    else
      render "comments/edit"
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

  def set_comment
    @comment = current_user.comments.find(params[:id])
  end
end
