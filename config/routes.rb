Rails.application.routes.draw do
  # get 'pages/home'
  root 'pages#home'
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items do
    get :upvote,    on: :member
    get :expensive, on: :collection
  end


  devise_for :users, path: 'auth', path_names:
      {
          sign_in: 'login',
          sign_out: 'logout',
          password: 'secret',
          confirmation: 'verification',
          unlock: 'unblock',
          registration: 'register',
          sign_up: 'cmon_let_me_in'
      }
end
