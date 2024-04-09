Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root "static_pages#top"

  resources :users, only: %i[new create]

  resources :boards, only: %i[index new create show edit update destroy] do
    resources :comments, only: %i[create edit destroy], shallow: true
    get :bookmarks, on: :collection
  end

  resources :bookmarks, only: %i[create destroy]

  resource :profile, only: %i[show edit update]


  resources :password_resets, only: %i[new create edit update]

  #ログインするとuser_sessionsのnewアクションにいく
  get '/login', to: 'user_sessions#new'
  #createはDBに保存もするためpostを使う
  post '/login', to: 'user_sessions#create'
  #ログアウトは
  delete '/logout', to: 'user_sessions#destroy'

  #adminページのルーティング
  namespace :admin do
    root 'dashboards#index'
    resource :dashboard, only: %i[index]
    get '/login', to: 'sessions#new', :as => :login
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy', :as => :logout
    resources :users, only: %i[index show edit update destroy]
    resources :boards, only: %i[index show edit update destroy]
  end

end
