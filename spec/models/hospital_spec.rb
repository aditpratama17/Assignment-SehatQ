require 'rails_helper'

RSpec.describe Hospital, type: :model do
    context 'hospital model' do
      describe '#hospital_name' do
        it { is_expected.to validate_presence_of(:hospital_name) }
      end

      describe '#address' do
        it { is_expected.to validate_presence_of(:address) }
      end
    end
end
