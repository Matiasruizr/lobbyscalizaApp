Rails.application.routes.draw do
  get 'audiencia/detalle'
  get 'buscador/activo'
  get 'index/index'

  root to: 'index#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
