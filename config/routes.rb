Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[new create]

  resources :boards, only: %i[index new create show edit update destroy] do
    resources :comments, only: %i[create edit destroy], shallow: true
  end
  root "static_pages#top"
  # Defines the root path route ("/")
  # root "articles#index"

  #ログインするとuser_sessionsのnewアクションにいく
  get '/login', to: 'user_sessions#new'
  #createはDBに保存もするためpostを使う
  post '/login', to: 'user_sessions#create'
  #ログアウトは
  delete '/logout', to: 'user_sessions#destroy'

end
