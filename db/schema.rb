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

ActiveRecord::Schema.define(version: 20170626193713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "interests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "idServidorPublico"
    t.integer "idApdf"
    t.datetime "fechaActualizacion"
    t.integer "idDeclaracionIntereses"
    t.string "nombre"
    t.string "puestoEncargo"
    t.integer "numeroRelacionesFamiliares"
    t.datetime "fechaPresentacion"
    t.string "laborales_nombreDistintoEmpleo"
    t.string "negocios_sociedad_mercantil"
    t.string "negocios_actividad_comercial"
    t.string "profesionales_nombreCamaraConfederaciones"
    t.string "profesionales_nombreColegiosAsociaciones"
    t.string "profesionales_nombrePrestacionServicios"
    t.string "profesionales_nombreFilantropicas"
  end

end
