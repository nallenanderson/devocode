Rails.application.routes.draw do
  root 'pages#home'

  get 'courses/index'

  resources :courses
  resources :videos
  resources :blogs

  devise_for :users

  get 'errors/file_not_found'
  get 'errors/unprocessable'
  get 'errors/internal_server_error'

  match '/404', to: 'errors#file_not_found', via: :all
	match '/422', to: 'errors#unprocessable', via: :all
	match '/500', to: 'errors#internal_server_error', via: :all
end
