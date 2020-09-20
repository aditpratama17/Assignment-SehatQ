class HospitalsController < ApplicationController

	def index
		@hospital = Hospital.all
		render json: { result:true, hospital:@hospital}, status: :ok
	end

	def show

		#Create an API list to display all doctors and hospitals

		@hospitalAndDoctor = ActiveRecord::Base.connection.execute("SELECT doctors.id, doctors.name, doctors.jabatan, doctors.id_hospital, hospitals.hospital_name, hospitals.address FROM doctors LEFT JOIN hospitals on doctors.id_hospital = hospitals.id")
		render json: { result:true, hospitalAndDoctor:@hospitalAndDoctor}, status: :ok
	end

end
