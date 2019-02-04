class BuscadorController < ApplicationController
  def activo
    # 
    if params[:desde]
      @desde = "'"+params[:desde][0]+"'"
    end
    if params[:hasta]
      @hasta = "'"+params[:hasta][0]+"'"
    end
    if params[:rut]
      @rut = "'"+params[:rut]+"'"
    end
    if params[:tipo]
      @tipo = "'"+params[:tipo]+"'"
    end


    if params[:tipo] == 'pasivo'
       @busquedalobbysta = ActiveRecord::Base.connection.execute("select comprador_nombre_usuario, comprador_rut_usuario, comprador_cargo_usuario, count(codigo_externo)
                                                                  from licitacion_detalle
                                                                  where comprador_rut_unidad = #{@rut}
                                                                  group by  comprador_rut_usuario
                                                                  order by count(codigo_externo) desc")

       @licitaciones_otorgadas = ActiveRecord::Base.connection.execute("select tipo, count(codigo_externo)  
                                                                        from licitacion_detalle where comprador_rut_unidad = #{@rut}
                                                                        group by tipo
                                                                        order by count(codigo_externo);")
      @datos = ActiveRecord::Base.connection.execute("select comprador_rut_unidad, comprador_nombre_organismo
                                                    from licitacion_detalle
                                                    where comprador_rut_unidad = #{@rut}
                                                    group by  comprador_rut_unidad;")
    elsif 
      params[:tipo] == 'activo'
      @busquedalobbysta = ActiveRecord::Base.connection.execute("select adjudicacion_nombre_proveedor, adjudicacion_rut_proveedor, total_monto from busqueda_lobbysta where adjudicacion_rut_proveedor = #{@rut};  ");
      @cantidad_audiencias = ActiveRecord::Base.connection.execute("select cantidad
                                                                    from cantidad_de_audiencias
                                                                    where representa_rut = #{@rut} ;")
      @audiencias1 = ActiveRecord::Base.connection.execute("select nombres, apellidos, 
                                                          remunerado , audiencias, id  
                                                          from audiencias1 
                                                          where representa_rut = #{@rut};")


      @licitaciones_que_participo =  ActiveRecord::Base.connection.execute("
                                                                          select  tipo, count(id) as 'cantidad' from licitacion_item
                                                                          join licitacion_detalle_licitacion_item  as inter
                                                                          on licitacion_item.id = inter.licitacion_item_id
                                                                          join licitacion_detalle on inter.codigo_externo = licitacion_detalle.codigo_externo
                                                                          where adjudicacion_rut_proveedor = #{@rut}
                                                                          group by  licitacion_detalle.tipo
                                                                          order by count(id) desc;  
     ")
    end
    
    
  end 
end
