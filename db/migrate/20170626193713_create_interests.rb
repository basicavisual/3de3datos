class CreateInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :interests do |t|
      t.timestamps
      t.integer :idServidorPublico
      t.integer :idApdf
      t.datetime :fechaActualizacion
      t.integer :idDeclaracionIntereses
      t.string :nombre
      t.string :puestoEncargo
      t.integer :numeroRelacionesFamiliares
      t.datetime :fechaPresentacion
      t.string :laborales_nombreDistintoEmpleo
      t.string :negocios_sociedad_mercantil
      t.string :negocios_actividad_comercial
      t.string :profesionales_nombreCamaraConfederaciones
      t.string :profesionales_nombreColegiosAsociaciones
      t.string :profesionales_nombrePrestacionServicios
      t.string :profesionales_nombreFilantropicas
    end
  end
end
