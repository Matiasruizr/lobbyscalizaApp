class IndexController < ApplicationController

  def top_compradores_del_estado
    # Top 10 licitaciones -> Top 10 compradores del estado
    @queryy =  ActiveRecord::Base.connection.execute("select * from top_10_compradores;")
    
  end
  
  def top_lobbysta_proveedor
    @top10_lobbysta_proveedor = ActiveRecord::Base.connection.execute("select * from top_10_lobbista LIMIT 10;")
  end
  
  def top_organismos_con_mas_audiencias
    # Top 10 Licitadores -> Top 10 proveedores del estado
    @top_compradores_estado = 	ActiveRecord::Base.connection.execute("select * from top_10_organismos order by `count(aud.id)` desc;")
  end
  
  def top_proveedores_del_estado
    @topproveedoresdelestado = ActiveRecord::Base.connection.execute("select * from top_10_proveedores;")
  end
  
  def index
    #Top 10 Compradores  
  end 

  def quees
       
  end 

end
