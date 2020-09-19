class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.integer :id_doctor_schedule
      t.integer :administrator
      
      t.timestamps
    end
  end
end
