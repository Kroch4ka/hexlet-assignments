# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  # BEGIN
  resources :posts do
    scope module: :posts do
      resources :comments, only: %i[new create]
    end
  end

  scope module: :posts do
    resources :comments, only: %i[show edit update destroy]
  end
  # END
end
