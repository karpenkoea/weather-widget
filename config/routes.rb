Rails.application.routes.draw do

  # get 'weather/historical/min', to: 'weathers#historical_min'
  # get 'weather/historical/max', to: 'weathers#historical_max'
  # get 'weather/historical/avg', to: 'weathers#historical_avg'

  resources :weather, only: %i[new create index], controller: 'weathers' do
    namespace :historical, controller: '/weathers' do
      get :min
      get :max
      get :avg
    end
  end

  root "pages#index"
end
