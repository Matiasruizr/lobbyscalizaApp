class LicitacionController < ApplicationController
  def licitacion

    @rut = params[:rut]
    @tipo = params[:tipo]
    @org = params[:nombre]

    if @tipo
      @licitacion_detalle =  ActiveRecord::Base.connection.execute( "
      select fecha_publicacion,
      licitacion_detalle.codigo_externo, comprador_region_unidad, comprador_nombre_unidad,
      comprador_rut_unidad, adjudicacion_nombre_proveedor, adjudicacion_url_acta
      from licitacion_item
      join licitacion_detalle_licitacion_item  as inter
      on licitacion_item.id = inter.licitacion_item_id
      join licitacion_detalle on inter.codigo_externo = licitacion_detalle.codigo_externo
      where comprador_rut_unidad = '#{@rut}'
      and tipo = '#{@tipo}'
      group by licitacion_detalle.codigo_externo;")

      #61.607.502-0
    else
      @comprador = 
      @licitacion_detalle =  ActiveRecord::Base.connection.execute( "select fecha_publicacion, 
      licitacion_detalle.codigo_externo, comprador_region_unidad, comprador_nombre_unidad, 
      comprador_rut_unidad, comprador_nombre_usuario, adjudicacion_url_acta
      from licitacion_item
      join licitacion_detalle_licitacion_item  as inter
      on licitacion_item.id = inter.licitacion_item_id
      join licitacion_detalle on inter.codigo_externo = licitacion_detalle.codigo_externo
      where comprador_rut_unidad = '#{@rut}' and comprador_nombre_organismo = '#{@org}';")

    end
  end
end
