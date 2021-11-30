Rails.application.routes.draw do
  root "warning_thresholds#index"

  resources :warning_thresholds
end
