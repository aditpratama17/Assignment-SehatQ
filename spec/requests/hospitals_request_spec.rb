require 'rails_helper'

RSpec.describe HospitalsController, type: :controller do
	context 'GET #index' do
		it 'return a succes resporn for call method index' do 
			hospital = Hospital.create!(hospital_name: 'First')
			get :index, params: { id: hospital.to_param }
			expect(response).to have_http_status(200)
		end
	end
end
