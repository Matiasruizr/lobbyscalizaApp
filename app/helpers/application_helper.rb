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
    def audienciasorg(rut,org)
        @audienciasorg = ActiveRecord::Base.connection.execute("select count(*)
          from asistente
          join cargo_activo as ca on asistente.cargo_activo_id = ca.id
          join audiencia_detalle_asistente as jds on asistente.id = jds.asistente_id
          join audiencia_detalle as ad on jds.audiencia_detalle_id = ad.id
          join audiencia_detalle_materia as adm on  ad.id = adm.audiencia_detalle_id
          join audiencia_materia as am on adm.audiencia_materia_id = am.id
          join audiencia_cabecera as auca on auca.id = ad.id
          join sujeto_pasivo_detalle spd on ad.sujeto_pasivo_id = spd.id
          where asistente.representa_rut = '#{rut}' and spd.institucion_nombre like '#{org}';")
    end
    #def tabla1(rut)
    #  @tabla1 = ActiveRecord::Base.connection.execute(
    #  "select count(*) from (select count(*)
    #  from licitacion_item
    #  join licitacion_detalle_licitacion_item  as inter
    #  on licitacion_item.id = inter.licitacion_item_id
    #  join licitacion_detalle on inter.codigo_externo = licitacion_detalle.codigo_externo
    #  where adjudicacion_rut_proveedor = '#{rut}'
    #  group by licitacion_detalle.codigo_externo)src;")
    #end
    #def tabla3(org)
    #  @tabla3 = ActiveRecord::Base.connection.execute("
    #    select count(*) from (select count(*) from licitacion_item
    #    join licitacion_detalle_licitacion_item  as inter
    #    on licitacion_item.id = inter.licitacion_item_id
    #    join licitacion_detalle on inter.codigo_externo = licitacion_detalle.codigo_externo
    #    where comprador_nombre_organismo = '#{org}'
    #    group by licitacion_detalle.codigo_externo)src;"
    #  )
    #  end
end
