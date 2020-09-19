class CreateDoctorSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :doctor_schedules do |t|
      t.integer :id_doctor
      t.integer :id_hospital
      t.string :schedule_day
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
