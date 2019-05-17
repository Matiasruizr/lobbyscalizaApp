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

    def contratos(rut)
        @contrato = ActiveRecord::Base.connection.execute("SELECT contratos, monto FROM cantidad_de_contratos where rut = '#{rut}';")
    end
end
