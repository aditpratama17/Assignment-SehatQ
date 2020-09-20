class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.integer :id_doctor_schedule
      t.integer :id_administrator
      t.integer :state
      
      t.timestamps
    end
  end
end
