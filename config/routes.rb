Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  resources :post_images, only: [:new, :create, :index, :show]
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    get "homes/about" => "homes#about"
end
