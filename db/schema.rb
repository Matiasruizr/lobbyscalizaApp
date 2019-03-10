# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "asistente", primary_key: ["id", "cargo_activo_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "id", null: false, auto_increment: true
    t.integer "active_position_id"
    t.text "apellidos"
    t.text "cargo_activo_url"
    t.text "nombres"
    t.text "representa_directorio"
    t.text "representa_domicilio"
    t.text "representa_giro"
    t.text "representa_naturaleza"
    t.text "representa_nombre"
    t.text "representa_pais"
    t.text "representa_tipo"
    t.text "representante_legal"
    t.integer "cargo_activo_id", null: false
    t.string "representa_rut"
    t.integer "sujeto_pasivo_id"
    t.index ["cargo_activo_id"], name: "fk_asistente_cargo_activo1_idx"
    t.index ["sujeto_pasivo_id"], name: "FK_SUJETO_PASIVO_ID"
  end

  create_table "audiencia_cabecera", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "apellidos"
    t.integer "audience_detail_id"
    t.text "cargo"
    t.text "comuna"
    t.text "detalles_url"
    t.text "fecha_inicio"
    t.text "fecha_termino"
    t.text "forma"
    t.text "institucion_url"
    t.text "lugar"
    t.text "nombres"
    t.text "referencia"
    t.integer "sujeto_pasivo_detail_id"
    t.text "sujeto_pasivo_url"
    t.text "updated"
    t.text "vista_publica_detalles_url"
    t.text "vista_publica_institucion_url"
    t.integer "institucion_detail_id"
    t.index ["institucion_detail_id"], name: "FK8o1b54wgbfw485v1wjiylomxp"
  end

  create_table "audiencia_detalle", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "sujeto_pasivo_url"
    t.text "institucion_url"
    t.integer "sujeto_pasivo_id"
    t.index ["sujeto_pasivo_id"], name: "FKqvahw2t3hoix3i7ifc5lojo3l"
  end

  create_table "audiencia_detalle_asistente", primary_key: ["audiencia_detalle_id", "asistente_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "audiencia_detalle_id", null: false
    t.integer "asistente_id", null: false
    t.index ["asistente_id"], name: "fk_audiencia_detalle_has_asistente_asistente1_idx"
    t.index ["audiencia_detalle_id"], name: "fk_audiencia_detalle_has_asistente_audiencia_detalle1_idx"
  end

  create_table "audiencia_detalle_materia", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "audiencia_materia_id", null: false
    t.integer "audiencia_detalle_id", null: false
    t.index ["audiencia_detalle_id"], name: "FK8ijpn40hp6kojepjep41ce23t"
    t.index ["audiencia_materia_id"], name: "FKtfb7bv3puh96o683q7qbo7jha"
  end

  create_table "audiencia_materia", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nombre"
  end

  create_table "audiencias1", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "nombres", limit: 200
    t.string "apellidos", limit: 200
    t.string "remunerado", limit: 10
    t.integer "audiencias"
    t.integer "id"
    t.string "representa_rut", limit: 50
  end

  create_table "busqueda_lobbysta", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "adjudicacion_nombre_proveedor", limit: 200
    t.string "adjudicacion_rut_proveedor", limit: 200
    t.string "total_monto", limit: 300
  end

  create_table "cantidad_de_audiencias", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "cantidad"
    t.string "representa_rut", limit: 40
  end

  create_table "cargo_activo", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "remunerado"
    t.text "sujeto_apellidos"
    t.text "sujeto_nombres"
    t.text "tipo"
  end

  create_table "institucion_detalle", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "nombre"
    t.text "codigo"
  end

  create_table "licitacion_detalle", primary_key: "codigo_externo", id: :string, limit: 30, default: "", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nombre"
    t.integer "codigo_estado"
    t.string "descripcion", limit: 5000
    t.text "tipo"
    t.string "estado", limit: 45
    t.string "comprador_codigo_organismo", limit: 45
    t.text "comprador_nombre_organismo"
    t.string "comprador_rut_unidad", limit: 45
    t.text "comprador_nombre_unidad"
    t.text "comprador_direccion_unidad"
    t.string "comprador_comuna_unidad"
    t.string "comprador_region_unidad"
    t.string "comprador_rut_usuario", limit: 45
    t.string "comprador_nombre_usuario", limit: 1000
    t.text "comprador_cargo_usuario"
    t.string "fecha_creacion", limit: 45
    t.string "fecha_inicio", limit: 45
    t.string "fecha_cierre", limit: 45
    t.string "fecha_final", limit: 45
    t.string "fecha_adjudicacion", limit: 45
    t.string "fecha_estimada_adjudicacion", limit: 45
    t.string "fecha_publicacion", limit: 45
    t.string "adjudicacion_fecha", limit: 45
    t.text "adjudicacion_numero"
    t.integer "adjudicacion_numero_oferentes"
    t.text "adjudicacion_url_acta"
    t.integer "adjudicacion_tipo"
  end

  create_table "licitacion_detalle_licitacion_item", primary_key: ["codigo_externo", "licitacion_item_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "codigo_externo", limit: 30, default: "", null: false
    t.integer "licitacion_item_id", null: false
    t.index ["codigo_externo"], name: "fk_licitacion_detalle_has_licitacion_item_licitacion_detall_idx"
    t.index ["licitacion_item_id"], name: "FK3o51if6mbvpqr9q2yrj3dfkra"
  end

  create_table "licitacion_item", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "correlativo"
    t.integer "codigo_producto"
    t.string "codigo_categoria", limit: 45
    t.text "categoria", limit: 16777215
    t.text "nombre_producto", limit: 16777215
    t.string "descripcion", limit: 1000, null: false
    t.string "unidad_medida", limit: 45
    t.integer "cantidad"
    t.string "adjudicacion_rut_proveedor", limit: 45
    t.text "adjudicacion_nombre_proveedor", limit: 16777215
    t.integer "adjudicacion_antidad"
    t.integer "adjudicacion_monto_unitario"
  end

  create_table "licitaciones_que_participo", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "tipo", limit: 10
    t.integer "cantidad"
    t.string "adjudicacion_rut_proveedor", limit: 20
  end

  create_table "sujeto_pasivo_detalle", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "apellidos"
    t.text "cargo"
    t.text "nombres"
    t.text "fecha_inicio"
    t.text "fecha_termino"
    t.string "institucion_codigo", limit: 45
    t.text "institucion_nombre"
    t.string "audiencias_url"
    t.string "donativos_url"
    t.string "institucion_url"
    t.string "resolucion"
    t.string "resolucion_url"
    t.string "viajes_url"
  end

  create_table "tmp_top10audienciasprivadas", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.bigint "cantidad_audiencias", default: 0, null: false
    t.text "nombre_proveedor", collation: "utf8_general_ci"
    t.string "representa_rut", collation: "utf8_general_ci"
  end

  create_table "tmp_top10audienciaspublicas", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.bigint "cantidad_audiencias", default: 0, null: false
    t.text "nombre_institucion", collation: "utf8_general_ci"
  end

  create_table "tmp_top10licitaciones", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.bigint "RUT", default: 0, null: false
    t.string "comprador_rut_unidad", limit: 45, collation: "utf8_general_ci"
    t.text "comprador_nombre_unidad", collation: "utf8_general_ci"
    t.decimal "MONTO", precision: 42
  end

  create_table "tmp_top10licitadores", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.bigint "rut", default: 0, null: false
    t.string "adjudicacion_rut_proveedor", limit: 45, collation: "utf8mb4_unicode_ci"
    t.text "adjudicacion_nombre_proveedor", limit: 16777215, collation: "utf8mb4_unicode_ci"
    t.decimal "monto", precision: 42
  end

  create_table "top_10_compradores", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "comprador_rut_unidad", limit: 45, collation: "utf8_general_ci"
    t.text "comprador_nombre_organismo", collation: "utf8_general_ci"
    t.decimal "sum(adjudicacion_monto_unitario * adjudicacion_antidad)", precision: 42
    t.bigint "count(id)", default: 0, null: false
  end

  create_table "top_10_lobbista", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "RUT", limit: 45, collation: "utf8mb4_unicode_ci"
    t.text "PROVEEDOR", limit: 16777215, collation: "utf8mb4_unicode_ci"
    t.bigint "cantidad_licitaciones_adjudicadas", default: 0, null: false
    t.decimal "MONTO", precision: 42
  end

  create_table "top_10_organismos", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.bigint "count(aud.id)", default: 0, null: false
    t.text "nombre", collation: "utf8_general_ci"
    t.text "CONCAT(s.nombres, ' ', s.apellidos)", limit: 4294967295, collation: "utf8_general_ci"
    t.integer "id", null: false
    t.integer "audiencias"
    t.string "RUT", limit: 13
    t.integer "licitaciones"
  end

  create_table "top_10_proveedores", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "RUT", limit: 45, collation: "utf8mb4_unicode_ci"
    t.text "PROVEEDOR", limit: 16777215, collation: "utf8mb4_unicode_ci"
    t.decimal "MONTO", precision: 42
    t.bigint "cantidad_licitaciones_adjudicadas", default: 0, null: false
  end

  add_foreign_key "asistente", "cargo_activo", name: "FKrjw116xxswu3qdrcqy9wkpddd"
  add_foreign_key "asistente", "cargo_activo", name: "fk_asistente_cargo_activo1"
  add_foreign_key "asistente", "sujeto_pasivo_detalle", column: "sujeto_pasivo_id", name: "FK_SUJETO_PASIVO_ID"
  add_foreign_key "audiencia_cabecera", "institucion_detalle", column: "institucion_detail_id", name: "FK8o1b54wgbfw485v1wjiylomxp"
  add_foreign_key "audiencia_detalle", "sujeto_pasivo_detalle", column: "sujeto_pasivo_id", name: "FK_SUJETO_PASIVO_ID_2"
  add_foreign_key "audiencia_detalle", "sujeto_pasivo_detalle", column: "sujeto_pasivo_id", name: "FKqvahw2t3hoix3i7ifc5lojo3l"
  add_foreign_key "audiencia_detalle_asistente", "asistente", name: "FK7j3k048xtllqnr7v8wyjqtnqv"
  add_foreign_key "audiencia_detalle_asistente", "asistente", name: "fk_audiencia_detalle_has_asistente_asistente1"
  add_foreign_key "audiencia_detalle_asistente", "audiencia_detalle", name: "FK1031t5oof6ai5ge31rr1as17a"
  add_foreign_key "audiencia_detalle_asistente", "audiencia_detalle", name: "fk_audiencia_detalle_has_asistente_audiencia_detalle1"
  add_foreign_key "audiencia_detalle_materia", "audiencia_detalle", name: "FK8ijpn40hp6kojepjep41ce23t"
  add_foreign_key "audiencia_detalle_materia", "audiencia_materia", column: "audiencia_materia_id", name: "FKtfb7bv3puh96o683q7qbo7jha"
  add_foreign_key "licitacion_detalle_licitacion_item", "licitacion_detalle", column: "codigo_externo", primary_key: "codigo_externo", name: "FKi6w2wtofi9qwf050dfug7jbwq"
  add_foreign_key "licitacion_detalle_licitacion_item", "licitacion_detalle", column: "codigo_externo", primary_key: "codigo_externo", name: "fk_licitacion_detalle_has_licitacion_item_licitacion_detalle"
  add_foreign_key "licitacion_detalle_licitacion_item", "licitacion_item", name: "FK3o51if6mbvpqr9q2yrj3dfkra"
end
