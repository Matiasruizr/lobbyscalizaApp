class IndexController < ApplicationController



  def index
      @top10_lobbysta_proveedor = ActiveRecord::Base.connection.execute("select * from top_10_lobbista;")

       #Top 10 Compradores
       @topproveedoresdelestado = ActiveRecord::Base.connection.execute("select * from top_10_compradores;")
   
   
       # Top 10 Licitadores -> Top 10 proveedores del estado
       @queryy =  ActiveRecord::Base.connection.execute("select * from top_10_proveedores;")
   
       # Top 10 licitaciones -> Top 10 compradores del estado
       @top_compradores_estado = 	ActiveRecord::Base.connection.execute("select * from top_10_organismos;")
  end 
end
