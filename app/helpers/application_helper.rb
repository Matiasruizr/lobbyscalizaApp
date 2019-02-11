module ApplicationHelper
    def audiencias(rut)
      @audiencias  = ActiveRecord::Base.connection.execute("SELECT count(*) FROM ASISTENTE WHERE representa_rut='#{rut}';")
    end
    def contratosorg(rut,org)
      @contratosorg = ActiveRecord::Base.connection.execute("select count(*) from (select count(*)
      from licitacion_item
      join licitacion_detalle_licitacion_item  as inter
      on licitacion_item.id = inter.licitacion_item_id
      join licitacion_detalle on inter.codigo_externo = licitacion_detalle.codigo_externo
      where adjudicacion_rut_proveedor = '#{rut}' 
      AND comprador_nombre_organismo='#{org}'
      group by licitacion_detalle.codigo_externo)src;")
    end
    def tabla1(rut)
      @tabla1 = ActiveRecord::Base.connection.execute(
      "select count(*) from (select count(*)
      from licitacion_item
      join licitacion_detalle_licitacion_item  as inter
      on licitacion_item.id = inter.licitacion_item_id
      join licitacion_detalle on inter.codigo_externo = licitacion_detalle.codigo_externo
      where adjudicacion_rut_proveedor = '#{rut}'
      group by licitacion_detalle.codigo_externo)src;")
    end
    def tabla3(org)
      @tabla3 = ActiveRecord::Base.connection.execute("
        select count(*) from (select count(*) from licitacion_item
        join licitacion_detalle_licitacion_item  as inter
        on licitacion_item.id = inter.licitacion_item_id
        join licitacion_detalle on inter.codigo_externo = licitacion_detalle.codigo_externo
        where comprador_nombre_organismo = '#{org}'
        group by licitacion_detalle.codigo_externo)src;"
      )
      end
end
