class CreateFiscals < ActiveRecord::Migration[5.1]
  def change
    create_table :fiscals do |t|
      t.timestamps
      t.integer :idDeclaracionInformacionFiscal
      t.integer :idServidorPublico
      t.integer :idApdf
      t.datetime :fechaTransmision
      t.string :nombre
      t.string :puestoEncargo
      t.string :ingresos
      t.string :impuesto
      t.datetime :fechaPresentacion
      t.string :totalSueldo
      t.string :impuestoRetenido
    end
  end
end
