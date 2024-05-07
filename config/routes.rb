Rails.application.routes.draw do

  devise_for :admin, controllers: {
  sessions: "admin/sessions"
  }

  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  root to: 'public/homes#top'

  namespace :public do
    get 'homes/about'
    get "search" => "searches#search"
    resources :post_players, only: [:new,:index,:show,:edit,:create,:destroy,:update] do
      resource :favorite, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end


    get 'users/my_page' => 'users#my_page', as: :my_page
    get 'users/unsubscribe' =>'users#unsubscribe', as: :unsubscribe
    patch 'users/withdraw' =>'users#withdraw', as: :withdraw
    resources :users, only: [:index,:show,:edit,:update] do
      resource :relationship, only: [:create,:destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

  end










  namespace :admin do
    get '/' => 'homes#top'
  end

  namespace :admin do
    get 'nationalites/index'
    get 'nationalites/edit'
  end
  namespace :admin do
    get 'post_players/index'
    get 'post_players/show'
    get 'post_players/edit'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
