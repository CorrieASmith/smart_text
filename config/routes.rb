Rails.application.routes.draw do
  devise_for :users
  root :to => "home#index"
  resources :messages, :only => [:index, :new, :create, :show]
  resources :contacts
end
