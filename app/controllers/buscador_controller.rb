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
    if params[:rutpasivo]
      @rutpas = "'"+params[:rutpasivo]+"'"
    end
    # Parametro comuna para audiencias, de no enviar ninguna comuna, muestra todo.
    if params[:comuna]
      @comuna = "'"+params[:comuna]+"%'"
    end
    

    if params[:tipo] == 'pasivo'
      @datos = ActiveRecord::Base.connection.execute("select comprador_rut_unidad, comprador_nombre_organismo
      from licitacion_detalle
      where comprador_rut_unidad = #{@rutpas}
      group by  comprador_rut_unidad;")
       @busquedalobbysta = ActiveRecord::Base.connection.execute("select CONCAT(spd.nombres,' ',spd.apellidos) as nombre, spd.cargo , count(audiencia_detalle.id) as numero_audiencias,
                                                                institucion_nombre, spd.id
                                                                from audiencia_detalle
                                                                join sujeto_pasivo_detalle spd on audiencia_detalle.sujeto_pasivo_id = spd.id
                                                                join institucion_detalle id on id.codigo = spd.institucion_codigo
                                                                join audiencia_cabecera auca on auca.id = audiencia_detalle.id
                                                                where institucion_nombre like '%#{@datos.first[1]}%' and auca.comuna like #{@comuna}
                                                                group by spd.id;")

       @licitaciones_otorgadas = ActiveRecord::Base.connection.execute("select tipo, count(codigo_externo)  
                                                                        from licitacion_detalle where comprador_rut_unidad = #{@rutpas}
                                                                        group by tipo
                                                                        order by count(codigo_externo);")
      @historial2 = ActiveRecord::Base.connection.execute("select IFNULL(adjudicacion_nombre_proveedor,'Otros Proveedores'), comprador_comuna_unidad, count(licitacion_detalle.codigo_externo) as cant, adjudicacion_rut_proveedor
      from licitacion_item
      join licitacion_detalle_licitacion_item  as inter
      on licitacion_item.id = inter.licitacion_item_id
      join licitacion_detalle on inter.codigo_externo = licitacion_detalle.codigo_externo
      where comprador_rut_unidad = #{@rutpas}
      group by adjudicacion_rut_proveedor
      order by cant desc
      LIMIT 100;")
    
    elsif  params[:tipo] == 'activo'
      @busquedalobbysta = ActiveRecord::Base.connection.execute("select adjudicacion_nombre_proveedor, adjudicacion_rut_proveedor, total_monto from busqueda_lobbysta where adjudicacion_rut_proveedor = #{@rut};  ");
      @cantidad_audiencias = ActiveRecord::Base.connection.execute("select cantidad
                                                                    from cantidad_de_audiencias
                                                                    where representa_rut = #{@rut} ;")
      @audiencias1 = ActiveRecord::Base.connection.execute("Select nombres, apellidos, 
        case
        when remunerado = 1 then 'si' 
        when remunerado =0 then 'No' end,
        count(asistente.id), cargo_activo.id from asistente
        join cargo_activo on asistente.cargo_activo_id=cargo_activo.id
        where representa_rut = #{@rut}
        group by nombres, apellidos
        ;")


      @licitaciones_que_participo =  ActiveRecord::Base.connection.execute("
        select tipo, sum(case when canted>0 THEN 1 ELSE 0 END) from (select tipo, count(*) as canted
      from licitacion_item
      join licitacion_detalle_licitacion_item  as inter
      on licitacion_item.id = inter.licitacion_item_id
      join licitacion_detalle on inter.codigo_externo = licitacion_detalle.codigo_externo
      where adjudicacion_rut_proveedor = #{@rut}
      group by licitacion_detalle.codigo_externo)src
      group by tipo
      order by tipo desc;
     ")

     @historial1 = ActiveRecord::Base.connection.execute("select comprador_nombre_organismo, comprador_comuna_unidad, count(licitacion_detalle.codigo_externo) as cant, comprador_rut_unidad
     from licitacion_item
     join licitacion_detalle_licitacion_item  as inter
     on licitacion_item.id = inter.licitacion_item_id
     join licitacion_detalle on inter.codigo_externo = licitacion_detalle.codigo_externo
     where adjudicacion_rut_proveedor = #{@rut}
     group by comprador_nombre_organismo
     order by cant desc
     LIMIT 100;")
    end
    
    
  end 
end
