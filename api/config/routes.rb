Rails.application.routes.draw do
  get "/r/:slug", to: "redirects#show"

  namespace :api do
    resources :links, only: [:create, :index, :show]
  end
end