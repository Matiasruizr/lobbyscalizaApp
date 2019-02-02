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
       @busquedalobbysta = ActiveRecord::Base.connection.execute("select tipo, count(codigo_externo)  from licitacion_detalle where comprador_rut_unidad = #{@rut};")
       @licitaciones_otorgadas = ActiveRecord::Base.connection.execute("select tipo, count(codigo_externo)  
                                                                        from licitacion_detalle where comprador_rut_unidad = #{@rut}
                                                                        group by tipo
                                                                        order by count(codigo_externo);")
    elsif 
      params[:tipo] == 'activo'
      @busquedalobbysta = ActiveRecord::Base.connection.execute("select adjudicacion_nombre_proveedor , adjudicacion_rut_proveedor, FORMAT(sum(adjudicacion_monto_unitario * adjudicacion_antidad),0) from licitacion_item where adjudicacion_rut_proveedor = #{@rut};  ");
      @audiencias1 = ActiveRecord::Base.connection.execute("select nombres, apellidos, 
                                                          case
                                                          when remunerado = 1 then 'Si'
                                                          when remunerado = 0 then 'No'
                                                          end, count(asistente.id), cargo_activo.id  
                                                          from asistente 
                                                          join cargo_activo on asistente.cargo_activo_id = cargo_activo.id
                                                          where representa_rut = #{@rut}
                                                          group by representa_rut;")


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
