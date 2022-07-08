require 'rails_helper'

RSpec.describe City, type: :model do
    describe 'relationships' do
        it {should belong_to :state}
    end

    describe 'validations' do
        it { should validate_presence_of :population }
        # it { should validate_presence_of :capitol }
        it { should validate_presence_of :name}
    end
end