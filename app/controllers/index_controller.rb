class IndexController < ApplicationController



  def index
 
    @top10_lobbysta_proveedor = ActiveRecord::Base.connection.execute("select * from tmp_top10licitadores limit 10")
    @topproveedoresdelestado = ActiveRecord::Base.connection.execute("select * from tmp_top10licitadores limit 10")
  end 
end
