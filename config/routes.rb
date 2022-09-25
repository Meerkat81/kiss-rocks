Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "artists#index"
  get "artists/:id", to: "artists#show", as: 'artist'
end
