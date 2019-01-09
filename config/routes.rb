Rails.application.routes.draw do
  root 'application#index'
  resources :journeys, only: :index do
    resources :steps, only: :show
  end

  resources :responses, only: %i[create update show]
end
