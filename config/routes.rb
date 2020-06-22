Rails.application.routes.draw do
  root to: 'about_us#home'
  get '/aboutus', to: 'about_us#page'
  resources :movies do 
    resources :comments
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
