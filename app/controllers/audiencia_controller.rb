class AudienciaController < ApplicationController
  def detalle 
    @id = "'"+params[:id]+"'"


    @licitacion_detalle =  ActiveRecord::Base.connection.execute( "select asistente.nombres, asistente.apellidos, am.nombre, representa_nombre,
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
                                                          where ca.id = #{@id};")

     
  end

  def detalleaudiencia
    @id = "'"+params[:id]+"'"
    @audiencia_detalle =  ActiveRecord::Base.connection.execute( "
    select asistente.nombres, asistente.apellidos, am.nombre, representa_nombre,
    auca.fecha_termino,
    referencia as 'tema',
    CONCAT(spd.nombres,' ',spd.apellidos) as 'sujeto pasivo',
    spd.cargo,
    spd.id,
    spd.institucion_nombre
    from asistente
    join cargo_activo as ca on asistente.cargo_activo_id = ca.id
    join audiencia_detalle_asistente as jds on asistente.id = jds.asistente_id
    join audiencia_detalle as ad on jds.audiencia_detalle_id = ad.id
    join audiencia_detalle_materia as adm on  ad.id = adm.audiencia_detalle_id
    join audiencia_materia as am on adm.audiencia_materia_id = am.id
    join audiencia_cabecera as auca on auca.id = ad.id
    join sujeto_pasivo_detalle spd on ad.sujeto_pasivo_id = spd.id
    where asistente.representa_rut = #{@id};")

  end
end
