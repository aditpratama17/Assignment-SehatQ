class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.integer :id_hospital
      t.string :name
      t.string :dokter_spesification

      t.timestamps
    end
  end
end
