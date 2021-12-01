class WarningThresholdsController < ApplicationController
  before_action :authenticate_user!

  def index
    @warning_thresholds = WarningThreshold.all
  end

  def show
    @warning_threshold = WarningThreshold.find(params[:id])
    @pm25 = AqiService.call(@warning_threshold.city)
  end

  def new
    @warning_threshold = WarningThreshold.new
  end

  def create
    @warning_threshold = WarningThreshold.new(warning_threshold_params)

    if @warning_threshold.save
      redirect_to @warning_threshold
    else
      render :new
    end
  end

  def edit
    @warning_threshold = WarningThreshold.find(params[:id])
  end

  def update
    @warning_threshold = WarningThreshold.find(params[:id])

    if @warning_threshold.update(warning_threshold_params)
      redirect_to @warning_threshold
    else
      render :edit
    end
  end

  def destroy
    @warning_threshold = WarningThreshold.find(params[:id])
    @warning_threshold.destroy
    redirect_to root_path
  end

  private

  def warning_threshold_params
    params.require(:warning_threshold).permit(:city, :threshold)
  end
end
