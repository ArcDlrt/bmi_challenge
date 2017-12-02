Rails.application.routes.draw do

  resources :bmi_calculators, only: [:index] do
    collection do
      post :calculate
    end
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }

  root 'home#index'

end
