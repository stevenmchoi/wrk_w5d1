Rails.application.routes.draw do
  resource :session, only: [:create, :new, :destroy]
  resources :users, only: [:create, :new, :edit, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
