class CreatePatrimonials < ActiveRecord::Migration[5.1]
  def change
    create_table :patrimonials do |t|
      t.integer :idServidorPublico
      t.integer :idDependencia
      t.datetime :fechaTransmision
      t.integer :idDeclaracionPatrimonio
      t.datetime :fechaPresentacion
      t.string :nombre
      t.string :puestoEncargo
      t.string :nivelMaximoEstudios
      t.integer :experienciaPrivado
      t.integer :experienciaPublico
      t.integer :ingresoTotalAnual
      t.integer :otrosIngresos
      t.string :tipoBien
      t.string :formaAdquisicion
      t.string :fechaAdquisicion
      t.string :valor
      t.string :tipoDeclaracion
      t.string :tipoGravamen
      t.string :institucionCuenta
      t.datetime :fechaGravamen
      t.string :cantidadRepresentadaGravamenes
      t.string :tipoInversion
      t.string :cantidadRepresentada
      t.string :tipoBienVehiculo
      t.string :puestoSimplificado
      t.string :genero
      t.timestamps
    end
  end
end
