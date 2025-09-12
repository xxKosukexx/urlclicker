# frozen_string_literal: true

Rails.application.routes.draw do
  get '/r/:slug', to: 'redirects#show'

  namespace :api do
    resources :links, only: %i[create index show]
  end
end
