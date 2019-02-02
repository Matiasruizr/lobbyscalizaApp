class AudienciaController < ApplicationController
  def detalle 
    @id = "'"+params[:id]+"'"


    @audiencia =  ActiveRecord::Base.connection.execute( "select nombres, apellidos, am.nombre, representa_nombre from asistente 
                                                          join cargo_activo as ca on asistente.cargo_activo_id = ca.id
                                                          join audiencia_detalle_asistente as jds on asistente.id = jds.asistente_id
                                                          join audiencia_detalle as ad on jds.audiencia_detalle_id = ad.id
                                                          join audiencia_detalle_materia as adm on  ad.id = adm.audiencia_detalle_id 
                                                          join audiencia_materia as am on adm.audiencia_materia_id = am.id
                                                          where ca.id = #{@id};")

        
  end
end
