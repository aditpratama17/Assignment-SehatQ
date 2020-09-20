class BooksController < ApplicationController

	def show

		#Create an API to display doctor schedule with patients

		@bookAll = ActiveRecord::Base.connection.execute("SELECT books.id, books.state, administrators.username, administrators.email, doctors.name, hospitals.hospital_name ,doctor_schedules.schedule_day, doctor_schedules.start_time, doctor_schedules.end_time FROM books LEFT JOIN administrators ON books.id_administrator = administrators.id LEFT JOIN doctor_schedules on books.id_doctor_schedule = doctor_schedules.id LEFT JOIN doctors ON doctor_schedules.id_doctor = doctors.id LEFT JOIN hospitals ON doctor_schedules.id_hospital = hospitals.id")
		render json: { result:true, bookAll: @bookAll }, status: :ok
	end

	def create

		#Create an API where user can book a schedule with doctor

		#The maximum user can book within 30 minutes before the doctor starts the schedule.

		#A total of 10 users can book the same doctor.

		@doctorSchedule = DoctorSchedule.where("id = ?", params[:book][:id_doctor_schedule])
		@schedule_day = @doctorSchedule.pluck(:schedule_day)
		@start_time = DateTime.parse(@doctorSchedule.pluck(:start_time).to_s)
		@day = Date.today.strftime("%A")
		@time1 = DateTime.now.to_s(:db)
		@time = DateTime.parse(@time1)

		@bookCount = Book.where("id_doctor_schedule = ?", params[:book][:id_doctor_schedule]).count

		@book = Book.create(book_param)

		if @day = @schedule_day
		   @timedif = TimeDifference.between(@start_time, @time).in_minutes
		   if @timedif > 30
		   	if @bookCount > 10
		   		render json: { result: 'maaf jumlah booking melebihi kapasitas maximal' }, status: :ok
		   	else
		   		if @book.save
		   		 render json: { result: 'hari yang dipilih sama dengan jadwal dan dapat di booking, terima kasih', books: @book }, status: :created
		   		else
		   		 render json: { result: 'gagal create data'  }, status: :unprocessable_entity
		   		end
		   	end
		   else
		   render json: { result: 'booking minimal 30 menit sebelum jadwal praktek' }, status: :unprocessable_entity
		   end

		else
		   render json: { result: 'hari yang dipilih tidak sama dengan jadwal' , schedule_day: @schedule_day, day: @day }, status: :unprocessable_entity
		end
	end

	private

	def book_param
	 	params.require(:book).permit(:id_doctor_schedule,:id_administrator,:state)
	end
end
