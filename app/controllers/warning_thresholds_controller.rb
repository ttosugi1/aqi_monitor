class WarningThresholdsController < ApplicationController
  before_action :authenticate_user!

  def index
    @warning_thresholds = WarningThreshold.where(user_id: current_user.id)
  end

  def show
    @warning_threshold = WarningThreshold.where(id: params[:id], user_id: current_user.id).first
    @pm25 = AqiService.call(@warning_threshold.city)
  end

  def new
    @warning_threshold = WarningThreshold.new(user: current_user)
  end

  def create
    @warning_threshold = WarningThreshold.new(warning_threshold_params)
    @warning_threshold.user = current_user

    if @warning_threshold.save
      redirect_to @warning_threshold
    else
      render :new
    end
  end

  def edit
    @warning_threshold = WarningThreshold.where(id: params[:id], user_id: current_user.id).first
  end

  def update
    @warning_threshold = WarningThreshold.where(id: params[:id], user_id: current_user.id).first

    if @warning_threshold.update(warning_threshold_params)
      redirect_to @warning_threshold
    else
      render :edit
    end
  end

  def destroy
    @warning_threshold = WarningThreshold.where(id: params[:id], user_id: current_user.id).first
    @warning_threshold.destroy
    redirect_to root_path
  end

  private

  def warning_threshold_params
    params.require(:warning_threshold).permit(:city, :threshold)
  end
end
