Rails.application.routes.draw do
  root 'stores#index'

  resource :store do
    resource :item
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
