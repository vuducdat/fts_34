Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  root "static_pages#home"

  get "help" => "static_pages#help"
  get "about" => "static_pages#about"
  get "contact" => "static_pages#contact"

  resources :users, only: :show
  resources :exams, except: :destroy

  namespace :admin do
    root "users#index"
    resources :users, except: [:show, :new, :create]
    resources :exams, except: [:edit, :update]
    resources :categories do
      resources :questions, except: :show
    end
  end
end
