Rails.application.routes.draw do
  resources :blogs

  get 'errors/file_not_found'
  get 'errors/unprocessable'
  get 'errors/internal_server_error'

  resources :courses do
    resources :videos
  end

  devise_for :users

  get "about" => "pages#about"
  root 'courses#index'

  match '/404', to: 'errors#file_not_found', via: :all
	match '/422', to: 'errors#unprocessable', via: :all
	match '/500', to: 'errors#internal_server_error', via: :all
end
