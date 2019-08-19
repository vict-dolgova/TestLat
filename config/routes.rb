Rails.application.routes.draw do
  resources :libraries, shallow: true do
    resources :employees
  end
  root 'libraries#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
