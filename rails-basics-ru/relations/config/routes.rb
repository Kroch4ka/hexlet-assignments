# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  # BEGIN
  resources :statuses
  # END
  resources :tasks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
