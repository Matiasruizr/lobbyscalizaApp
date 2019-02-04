class ApplicationController < ActionController::Base

    @activos = ActiveRecord::Base.connection.execute( "select adjudicacion_rut_proveedor, adjudicacion_nombre_proveedor from licitacion_item
                                                    group by adjudicacion_rut_proveedor;")
                                                    

    @pasivos = ActiveRecord::Base.connection.execute( "select comprador_rut_unidad, comprador_nombre_organismo
                                                    from licitacion_detalle
                                                    group by comprador_rut_unidad;")
end
