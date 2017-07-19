Rails.application.routes.draw do

  get 'welcome/index'
  get 'interests/index'
  get 'interests/import'
  get 'fiscals/index'
  get 'fiscals/import'
  get 'patrimonials/index'
  get 'patrimonials/import'

  resources :fiscals do
    collection { post :import }
  end

  resources :interests do
    collection { post :import }
  end

  resources :patrimonials do
    collection { post :import }
  end

   root to: "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
