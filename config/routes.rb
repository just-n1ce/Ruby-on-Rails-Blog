# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'api/v1/posts#index'

  namespace :api do
    namespace :v1 do
      devise_for :users, format: :json
      resources :users, only: %i[show]
      resources :categories, only: %i[show]
      resources :posts do
        resources :comments, only: %i[index create destroy]
      end
    end
  end
end
