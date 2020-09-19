class DoctorController < ApplicationController
	def index
		@doctor = Doctor.all
		render json: { result: true, doctor: @doctor }, status: :ok
	end
end
