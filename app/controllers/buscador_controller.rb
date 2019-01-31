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
      # @busquedalobbysta = ActiveRecord::Base.connection.execute("select * from tmp_top10licitadores where tmp_top10licitadores.adjudicacion_rut_proveedor = '#{params[:rut]}'")
   
    elsif 
      params[:tipo] == 'activo'
      @busquedalobbysta = ActiveRecord::Base.connection.execute("select representa_nombre, representa_rut from asistente where representa_rut = #{@rut};  ");
      @audiencias = ActiveRecord::Base.connection.execute("select nombres, apellidos, 
                                                          case
                                                          when remunerado = 1 then 'Si'
                                                          when remunerado = 0 then 'No'
                                                          end, count(asistente.id), cargo_activo.id  
                                                          from asistente 
                                                          join cargo_activo on asistente.cargo_activo_id = cargo_activo.id
                                                          where representa_rut = #{@rut}
                                                          group by representa_rut;")
    end
    
    
  end 
end
