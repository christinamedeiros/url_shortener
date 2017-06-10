Rails.application.routes.draw do
  resources :shortners
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'shortners#index'

  get '/login' => 'login#login'
  post '/login' => 'shortners#index'
  get ':url_id' => 'shortners#forward'


end
