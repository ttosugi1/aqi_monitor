Rails.application.routes.draw do
  get 'warning_thresholds', to: 'warning_thresholds#index'
  get 'warning_thresholds/:id', to: 'warning_thresholds#show'
end
