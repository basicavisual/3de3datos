Rails.application.routes.draw do

  resources :fiscals do
    collection { post :import }
  end

  get 'fiscals/index'

  get 'fiscals/import'
   root to: "fiscals#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
