# To deliver this notification:
#
# CommentNotifier.with(record: @post, message: "New post").deliver(User.all)

class CommentNotifier < ApplicationNotifier
  # Add your delivery methods
  #
  # deliver_by :email do |config|
  #   config.mailer = "UserMailer"
  #   config.method = "new_comment"
  # end
  #
  # bulk_deliver_by :slack do |config|
  #   config.url = -> { Rails.application.credentials.slack_webhook_url }
  # end
  #
  # deliver_by :custom do |config|
  #   config.class = "MyDeliveryMethod"
  # end

  # Add required params
  #
  # required_param :message

  def message
    @commentable = record.commentable
    @user = record.user
    "#{@user.name}が#{@commentable.model_name.human}にコメントしました。"
  end

  def url
    case record.commentable.class.name
    when "Question"
      question_path(record.commentable)
    else
      ""
    end
  end
end
