class LicitacionController < ApplicationController
  def licitacion

    @rut = params[:rut]
    @tipo = params[:tipo]
   

    if @tipo
      @licitacion_detalle =  ActiveRecord::Base.connection.execute( " select fecha_publicacion,
      licitacion_detalle.codigo_externo, comprador_region_unidad, adjudicacion_nombre_proveedor,
      adjudicacion_rut_proveedor, comprador_nombre_usuario,  adjudicacion_url_acta, comprador_rut_unidad
      from licitacion_item
      join licitacion_detalle_licitacion_item  as inter
      on licitacion_item.id = inter.licitacion_item_id
      join licitacion_detalle on inter.codigo_externo = licitacion_detalle.codigo_externo
      where comprador_rut_unidad = '#{@rut}'
      and tipo = '#{@tipo}'
      group by licitacion_detalle.codigo_externo;")

    else
      @org = params[:nombre]
      @licitacion_detalle =  ActiveRecord::Base.connection.execute( "select fecha_publicacion,
      licitacion_detalle.codigo_externo, comprador_region_unidad, adjudicacion_nombre_proveedor,
      adjudicacion_rut_proveedor, comprador_nombre_usuario,  adjudicacion_url_acta, comprador_rut_unidad
      from licitacion_item
      join licitacion_detalle_licitacion_item  as inter
      on licitacion_item.id = inter.licitacion_item_id
      join licitacion_detalle on inter.codigo_externo = licitacion_detalle.codigo_externo
      where comprador_rut_unidad = '#{@rut}' and comprador_nombre_organismo = '#{@org}';")

    end
  end
end
