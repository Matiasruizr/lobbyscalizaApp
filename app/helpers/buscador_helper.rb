module BuscadorHelper
    def descripcionDeTipo(x)
        case x
        when 'L1'
        return 'Licitación Pública Menor a 100 UTM (L1)'
        when 'LE'
        return	'Licitación Pública Entre 100 y 1000 UTM (LE)'
        when 'LP'
        return 'Licitación Pública Mayor 1000 UTM (LP)'
        when 'LQ'
        return 'Licitación Pública igual o superior a 2.000 UTM e inferior a 5.000 UTM'
        when 'LR'
        return 'Licitación Pública igual o superior a 5.000 UTM'
        when 'LS'
        return 'Licitación Pública Servicios personales especializados (LS)'
        when 'A1'
        return 'Licitación Privada por Licitación Pública anterior sin oferentes (A1)'
        when 'B1'
        return 'Licitación Privada por Remanente de Contrato anterior (B1)'
        when 'E1'
        return 'Licitación Privada por Convenios con Personas Jurídicas Extranjeras fuera del Territorio Nacional (E1)'
        when 'F1'
        return 'Licitación Privada por Servicios de Naturaleza Confidencial (F1)'
        when 'J1'
        return 'Licitación Privada por otras causales, excluidas de la ley de Compras (J1)'
        when 'CO'
        return 'Licitación Privada entre 100 y 1000 UTM'
        when 'B2'
        return 'Licitación Privada Mayor a 1000 UTM'
        when 'A2'
        return 'Trato Directo por Producto de Licitación Privada anterior sin oferentes o desierta (A2)'
        when 'D1'
        return 'Trato Directo por Proveedor Único (D1)'
        when 'E2'
        return 'Licitación Privada Menor a 100 UTM'
        when 'C2'
        return 'Trato Directo (Cotización) (C2)'
        when 'C1'
        return 'Compra Directa (Orden de compra) (C1)'
        when 'F2'
        return 'Trato Directo (Cotización) (F2)'
        when 'F3'
        return 'Compra Directa (Orden de compra) (F3)'
        when 'G2'
        return 'Directo (Cotización) (G2)'
        when 'G1'
        return 'Compra Directa (Orden de compra) (G1)'
        when 'R1'
        return 'Orden de Compra menor a 3 UTM (R1)'
        when 'CA'
        return 'Orden de Compra sin Resolución (CA)'
        when 'SE'
        return 'Orden de Compra proveniente de adquisición sin emisión automática de OC (SE)'
        when 'H2'
        return  'Licitación Privada igual o superior a 2000 UTM e inferior a 5000 UTM'
        when 'I2'
        return 'Licitación Privada Mayor a 5000 UTM'
        else
        return 'Licitación'
        end
    end
    def historial11(rut,org)
        @historial11 = ActiveRecord::Base.connection.execute("select count(*)	
        from asistente
        join cargo_activo as ca on asistente.cargo_activo_id = ca.id
        join audiencia_detalle_asistente as jds on asistente.id = jds.asistente_id
        join audiencia_detalle as ad on jds.audiencia_detalle_id = ad.id
        join sujeto_pasivo_detalle spd on ad.sujeto_pasivo_id = spd.id
        where asistente.representa_rut = '#{rut}' and spd.institucion_nombre like '%#{org}%';")
    end
end
