class IndexController < ApplicationController



  def index
    @top10_lobbysta_proveedor = ActiveRecord::Base.connection.execute("select * from tmp_top10licitadores limit 10")
    @topproveedoresdelestado = ActiveRecord::Base.connection.execute("select * from tmp_top10licitadores limit 10")


    # Top 10 Licitadores -> Top 10 proveedores del estado
    @queryy =  ActiveRecord::Base.connection.execute("select count(id) as cantidad_licitaciones_adjudicadas, adjudicacion_rut_proveedor,
                                                      adjudicacion_nombre_proveedor, sum(adjudicacion_monto_unitario * adjudicacion_antidad)
                                                      from licitacion_item 
                                                      group by adjudicacion_rut_proveedor 
                                                      order by cantidad_licitaciones_adjudicadas desc
                                                      limit 5;")

    # Top 10 licitaciones -> Top 10 compradores del estado
    @top_compradores_estado = 	ActiveRecord::Base.connection.execute("select count(id), comprador_rut_unidad, comprador_nombre_organismo, sum(adjudicacion_monto_unitario * adjudicacion_antidad)
                                                                      from licitacion_item as li 
                                                                      join licitacion_detalle_licitacion_item as inter on li.id = inter.licitacion_item_id
                                                                      join licitacion_detalle as ld on ld.codigo_externo = inter.codigo_externo
                                                                      group by ld.comprador_rut_unidad
                                                                      order by count(id) desc
                                                                      limit 10;")
  end 
end
