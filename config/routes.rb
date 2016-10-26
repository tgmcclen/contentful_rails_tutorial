Rails.application.routes.draw do
  root 'welcome#index'

  resources :contentful_users do
    resources :products, only: :show
  end
end
