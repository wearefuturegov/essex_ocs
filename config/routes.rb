Rails.application.routes.draw do
  root 'application#index'
  resources :journeys, only: :index do
    resources :steps, only: :show
  end

  resources :responses, only: %i[new create update show] do
    patch :send_results_sms
    get '/:help_category_result', to: 'responses#help_category_result', as: 'help_category_result'
  end

  comfy_route :cms_admin, path: "/admin"
  # Ensure that this route is defined last
  comfy_route :cms, path: "/"
end
