class BuscadorController < ApplicationController
  def activo
    # 
    @rut = "'"+params[:rut]+"'"
    # if params[:tipo] == 'comprador'
      # @busquedalobbysta = ActiveRecord::Base.connection.execute("select * from tmp_top10licitadores where tmp_top10licitadores.adjudicacion_rut_proveedor = '#{params[:rut]}'")
    @busquedalobbysta = ActiveRecord::Base.connection.execute("select representa_nombre, representa_rut from asistente where representa_rut = #{@rut};  ");
    # end
    
    @audiencias =  ActiveRecord::Base.connection.execute("select nombres, apellidos , remunerado, count(asistente.id), cargo_activo.id  
                                                          from asistente 
                                                          join cargo_activo on asistente.cargo_activo_id = cargo_activo.id
                                                          where representa_rut = #{@rut}
                                                          group by representa_rut;")
  end
end
