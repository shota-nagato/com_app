class Markdown::PreviewsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def create
    html = view_context.markdown(params[:content])
    render json: {html: html}
  end
end
