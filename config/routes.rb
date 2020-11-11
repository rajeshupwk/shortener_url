Rails.application.routes.draw do
  resources :urls

  root 'urls#new'

  get '/s/:slug', to: 'urls#shortener'
end
