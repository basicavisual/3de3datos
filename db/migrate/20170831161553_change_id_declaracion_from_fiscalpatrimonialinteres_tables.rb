class ChangeIdDeclaracionFromFiscalpatrimonialinteresTables < ActiveRecord::Migration[5.1]
  def change
    rename_column :fiscals, :idDeclaracionInformacionFiscal, :id_declaracion_fiscal
    rename_column :patrimonials, :idDeclaracionPatrimonio, :id_declaracion_patrimonio
    rename_column :interests, :idDeclaracionIntereses, :id_declaracion_interes

  end
end
