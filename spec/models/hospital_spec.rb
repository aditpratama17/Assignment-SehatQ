require 'rails_helper'

RSpec.describe Hospital, type: :model do
  context 'validation tests' do
    it 'ensures hospital name presence' do
      hospital = Hospital.new(address: 'jakarta').save
      expect(Hospital).to eq(false)
    end

    it 'ensures address presence' do
      hospital = Hospital.new(hospital_name: 'Budi Lin').save
      expect(Hospital).to eq(false)
    end
  end
end
