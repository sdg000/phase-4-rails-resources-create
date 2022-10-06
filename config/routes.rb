Rails.application.routes.draw do

# include only preferred routes#actions
  resources :birds, only: [:index, :show, :create]
end
