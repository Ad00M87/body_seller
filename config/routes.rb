Rails.application.routes.draw do
  devise_for :users
  resources :cadavers

  root 'cadavers#index'
end
