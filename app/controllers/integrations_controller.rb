class IntegrationsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @integration = Integration.new
  end

  def create
    @integration = current_user.integrations.new(integration_params)

    if @integration.save
      redirect_to integrations_path, notice: "登録しました。"
    else
      render :new, params: {name: "ToggleTrack"}, status: :unprocessable_entity
    end
  end

  def destroy
    @integration = Integration.find(params[:id])
    @integration.destroy!

    redirect_to integrations_path, notice: "トークンを削除しました。"
  end

  private

  def integration_params
    params.require(:integration).permit(:name, :token)
  end
end
