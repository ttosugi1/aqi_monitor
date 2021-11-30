class WarningThresholdsController < ApplicationController
  def index
    @warning_thresholds = WarningThreshold.all
  end

  def show
    @warning_threshold = WarningThreshold.find(params[:id])
    @pm25 = AqiService.call(@warning_threshold.city)
  end
end
