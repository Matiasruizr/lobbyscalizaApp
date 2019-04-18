class AudienciaController < ApplicationController
  def detalle 
    @id = params[:id]
    @rut = params[:rut]
    @org = params[:nombre]
    @ruta = params[:ruta]
    @representa = params[:representa]
    @apellido = params[:apellido]
    @nombre = params[:nombre]
    
   

   
    if @ruta == 'index'
      
      # Detalle audiencia para link de tabla 4 desde el inicio, que filtra por organizmo proveedor
      @audiencia_detalle =  ActiveRecord::Base.connection.execute( "
                            select asistente.nombres, asistente.apellidos, am.nombre, representa_nombre,
                            auca.fecha_termino,
                            referencia as 'tema',
                            CONCAT(spd.nombres,' ',spd.apellidos) as 'sujeto pasivo',
                            spd.cargo,
                            spd.institucion_nombre
                            from asistente
                            join cargo_activo as ca on asistente.cargo_activo_id = ca.id
                            join audiencia_detalle_asistente as jds on asistente.id = jds.asistente_id
                            join audiencia_detalle as ad on jds.audiencia_detalle_id = ad.id
                            join audiencia_detalle_materia as adm on  ad.id = adm.audiencia_detalle_id
                            join audiencia_materia as am on adm.audiencia_materia_id = am.id
                            join audiencia_cabecera as auca on auca.id = ad.id
                            join sujeto_pasivo_detalle spd on ad.sujeto_pasivo_id = spd.id
                            where asistente.representa_rut = '#{@rut}' and spd.institucion_nombre like '#{@org}';")
    elsif @rut
      @audiencia_detalle =  ActiveRecord::Base.connection.execute( "
                          select asistente.nombres, asistente.apellidos, am.nombre, representa_nombre,
                          auca.fecha_termino,
                          referencia as 'tema',
                          CONCAT(spd.nombres,' ',spd.apellidos) as 'sujeto pasivo',
                          spd.cargo,
                          spd.institucion_nombre
                          from asistente
                          join cargo_activo as ca on asistente.cargo_activo_id = ca.id
                          join audiencia_detalle_asistente as jds on asistente.id = jds.asistente_id
                          join audiencia_detalle as ad on jds.audiencia_detalle_id = ad.id
                          join audiencia_detalle_materia as adm on  ad.id = adm.audiencia_detalle_id
                          join audiencia_materia as am on adm.audiencia_materia_id = am.id
                          join audiencia_cabecera as auca on auca.id = ad.id
                          join sujeto_pasivo_detalle spd on ad.sujeto_pasivo_id = spd.id
                          where representa_rut = '#{@rut}';") 
      elsif @representa
        @audiencia_detalle = ActiveRecord::Base.connection.execute("select asistente.nombres, asistente.apellidos, am.nombre, representa_nombre,
          auca.fecha_termino,
          referencia as 'tema',
          CONCAT(spd.nombres,' ',spd.apellidos) as 'sujeto pasivo',
          spd.cargo,
          spd.institucion_nombre
          from asistente
          join cargo_activo as ca on asistente.cargo_activo_id = ca.id
          join audiencia_detalle_asistente as jds on asistente.id = jds.asistente_id
          join audiencia_detalle as ad on jds.audiencia_detalle_id = ad.id
          join audiencia_detalle_materia as adm on  ad.id = adm.audiencia_detalle_id
          join audiencia_materia as am on adm.audiencia_materia_id = am.id
          join audiencia_cabecera as auca on auca.id = ad.id
          join sujeto_pasivo_detalle spd on ad.sujeto_pasivo_id = spd.id
          where asistente.nombres like '#{@nombre}' and asistente.apellidos like '#{@apellido}' and representa_rut like '#{@representa}';")
      else
      @audiencia_detalle =  ActiveRecord::Base.connection.execute( "select asistente.nombres, asistente.apellidos, am.nombre, representa_nombre,
                                                                    auca.fecha_termino,
                                                                    referencia as 'tema',
                                                                    CONCAT(spd.nombres,' ',spd.apellidos) as 'sujeto pasivo',
                                                                    spd.cargo,
                                                                    spd.institucion_nombre
                                                                    from asistente
                                                                    join cargo_activo as ca on asistente.cargo_activo_id = ca.id
                                                                    join audiencia_detalle_asistente as jds on asistente.id = jds.asistente_id
                                                                    join audiencia_detalle as ad on jds.audiencia_detalle_id = ad.id
                                                                    join audiencia_detalle_materia as adm on  ad.id = adm.audiencia_detalle_id
                                                                    join audiencia_materia as am on adm.audiencia_materia_id = am.id
                                                                    join audiencia_cabecera as auca on auca.id = ad.id
                                                                    join sujeto_pasivo_detalle spd on ad.sujeto_pasivo_id = spd.id
                                                                    where ca.id = '#{@id}';")
    end
  end

  def detalleaudiencia
    @sujeto_id = params[:sujeto_id]
    @nombre_organizmo = params[:nombre_organizmo]

    @audiencia_detalle =  ActiveRecord::Base.connection.execute( "
    select asistente.nombres, asistente.apellidos, am.nombre, representa_nombre,
    auca.fecha_termino,
    referencia as 'tema',
    CONCAT(spd.nombres,' ',spd.apellidos) as 'sujeto pasivo',
    spd.cargo,
    spd.id,
    i.nombre,
    lugar,
    representa_rut
    from asistente
    join cargo_activo as ca on asistente.cargo_activo_id = ca.id
    join audiencia_detalle_asistente as jds on asistente.id = jds.asistente_id
    join audiencia_detalle as ad on jds.audiencia_detalle_id = ad.id
    join audiencia_detalle_materia as adm on  ad.id = adm.audiencia_detalle_id
    join audiencia_materia as am on adm.audiencia_materia_id = am.id
    join audiencia_cabecera as auca on auca.id = ad.id
    join sujeto_pasivo_detalle spd on ad.sujeto_pasivo_id = spd.id
    join institucion_detalle i on spd.institucion_codigo = i.codigo
    where i.nombre like '%#{@nombre_organizmo}%'
    and spd.id = #{@sujeto_id}
    group by audiencia_materia_id;
    ")

  end
end
