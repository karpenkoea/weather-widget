Rails.application.routes.draw do
  resources :characters do
    member do
      get :weather
    end
  end
  root "pages#index"
end
