Rails.application.routes.draw do

  devise_for :admin, controllers: {
  sessions: "admin/sessions"
  }

  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }



  root to: 'public/homes#top'

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  namespace :public do
    get 'homes/about'
    get "search" => "searches#search"

    resources :notifications, only: [:update]

    resources :nationalities, only: [:show]

    resources :post_players, only: [:new,:index,:show,:edit,:create,:destroy,:update] do
      resource :favorite, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end


    get 'users/my_page' => 'users#my_page', as: :my_page
    get 'users/unsubscribe' =>'users#unsubscribe', as: :unsubscribe
    patch 'users/withdraw' =>'users#withdraw', as: :withdraw
    resources :users, only: [:index,:show,:edit,:update] do
      member do
        get :favorites
      end
      resource :relationship, only: [:create,:destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

  end



  namespace :admin do
    get '/' => 'homes#top'
    get "search" => "searches#search"

    resources :nationalities, only: [:show,:index,:edit,:create,:update,:destroy]

    resources :post_players, only: [:index,:show,:edit,:create,:update,:destroy] do
      resources :comments, only: [:destroy]
    end

    resources :users, only: [:index,:show,:edit,:update] do
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end