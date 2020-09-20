require 'rails_helper'

RSpec.describe BooksController, type: :controller do
	context 'GET #show' do
		before do
	      get :show
	    end
	    it "returns http success" do
	      expect(response).to have_http_status(:success)
	    end
	    it "JSON body response contains expected recipe attributes" do
	      json_response = JSON.parse(response.body)
	      expect(json_response.keys).to match_array(['bookAll', 'result'])
	    end
	end


	describe "POST book#create" do
	  it "should create a new booking dcotor schedule" do
	    book = Book.create(id_doctor_schedule: 1, id_administrator: 1, state: 0)
	    expect(book).to be_valid
	  end
	end
end
