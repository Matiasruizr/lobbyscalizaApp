Rails.application.routes.draw do
  get 'licitacion/licitacion'
  get 'audiencia/detalle'
  get 'audiencia/detalleaudiencia'
  get 'buscador/activo'
  get 'index/index'

  get 'index/quees'
  get 'index/top_compradores_del_estado'
  get 'index/top_lobbysta_proveedor'
  get 'index/top_organismos_con_mas_audiencias'
  get 'index/top_proveedores_del_estado'




  root to: 'index#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
