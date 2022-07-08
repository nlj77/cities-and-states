require 'rails_helper'  

RSpec.describe State, type: :model do
    describe 'relationships' do
        it {should have_many :cities }
    end

    describe 'validations' do
        it { should validate_presence_of :name }
    end
end