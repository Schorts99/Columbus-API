# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             defaults: { format: :json },
             path: '',
             path_names: {
               sign_in: 'api/v1/login',
               sign_out: 'api/v1/logout',
               registration: 'api/v1/signup'
             },
             controllers: {
               sessions: 'api/v1/sessions',
               registrations: 'api/v1/registrations'
             }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get :current_user, to: 'current_user#show'
      get :checkouts, to: 'checkouts#index'

      namespace :current_user do
        get :cart, to: 'cart#show'
        resources :addresses
        post :checkout, to: 'checkout#create'

        namespace :cart do
          patch :products, to: 'products#update'
          get :products, to: 'products#index'
        end
      end

      get :products, to: 'products#index'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
