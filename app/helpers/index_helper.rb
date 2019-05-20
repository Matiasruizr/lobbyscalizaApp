module IndexHelper
    def audienciast4(org)
        @audienciast4 = ActiveRecord::Base.connection.execute("select count(*)
        from asistente
        join cargo_activo as ca on asistente.cargo_activo_id = ca.id
        join audiencia_detalle_asistente as jds on asistente.id = jds.asistente_id
        join audiencia_detalle as ad on jds.audiencia_detalle_id = ad.id
        join audiencia_detalle_materia as adm on  ad.id = adm.audiencia_detalle_id
        join audiencia_materia as am on adm.audiencia_materia_id = am.id
        join audiencia_cabecera as auca on auca.id = ad.id
        join sujeto_pasivo_detalle spd on ad.sujeto_pasivo_id = spd.id
        where spd.institucion_nombre like '#{org}';")
    end
    def contadoraudiencias(org)
        @contadoraudiencias = ActiveRecord::Base.connection.execute("Select count(*) from (
            select distinct auca.fecha_inicio, auca.fecha_termino, spd.fecha_inicio as fechaini, spd.fecha_termino as fechatermi
            from asistente
            join cargo_activo as ca on asistente.cargo_activo_id = ca.id
            join audiencia_detalle_asistente as jds on asistente.id = jds.asistente_id
            join audiencia_detalle as ad on jds.audiencia_detalle_id = ad.id
            join audiencia_cabecera as auca on auca.id = ad.id
            join sujeto_pasivo_detalle spd on ad.sujeto_pasivo_id = spd.id
            where  spd.institucion_nombre like '#{org}') asd;")
    end 

    def cantidad_de_contratos_adjuntos(rut)
        @contratos = ActiveRecord::Base.connection.execute("select contratos from cantidad_de_contratos_adjuntos where rut = '#{rut}' ;")
        # "select sum(cnt.cant) from (select sum(case when src.canted >= 0 THEN 1 ELSE 0 END) as cant from (select tipo, count(*) as canted
        # from licitacion_item
        # join licitacion_detalle_licitacion_item  as inter
        # on licitacion_item.id = inter.licitacion_item_id
        # join licitacion_detalle on inter.codigo_externo = licitacion_detalle.codigo_externo
        # where adjudicacion_rut_proveedor = '#{rut}'
        # group by licitacion_detalle.codigo_externo
        # )src
        # group by tipo
        # order by tipo desc) cnt;"
    end

    def contratos_pasivos(rut)
        @contratos_pas = ActiveRecord::Base.connection.execute("select sum(cnt.contrato) from (select count(codigo_externo) as contrato
        from licitacion_detalle where comprador_rut_unidad = '#{rut}'
        group by tipo
        order by count(codigo_externo))cnt;")
    end
end
