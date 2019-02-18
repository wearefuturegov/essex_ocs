Rails.application.routes.draw do
  root 'application#index'
  resources :journeys, only: :index do
    resources :steps, only: :show
  end

  resources :responses, only: %i[create update show] do
    patch :send_results_sms
  end

  comfy_route :cms_admin, path: "/admin"
  # Ensure that this route is defined last
  comfy_route :cms, path: "/"
end
