Rails.application.routes.draw do
  devise_for :users
  root "warning_thresholds#index"

  # root to: "warning_thresholds#index"
  resources :warning_thresholds
end
