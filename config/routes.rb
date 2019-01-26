Rails.application.routes.draw do
  get 'buscador/buscador'
  get 'index/index'

  root to: 'index#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
