class BuscadorController < ApplicationController
  def buscador
    # 
    @busquedalobbysta = ActiveRecord::Base.connection.execute("select * from tmp_top10licitadores where tmp_top10licitadores.adjudicacion_rut_proveedor = '#{params[:rut]}'")
  end
end
