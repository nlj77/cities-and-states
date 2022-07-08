require 'rails_helper'  

RSpec.describe State, type: :model do
    describe 'relationships' do
        it {should have_many :cities }
    end

    describe 'validations' do
        it { should validate_presence_of :name }
        it { should validate_presence_of :number_of_lakes }
        it { should validate_presence_of :biome}
        it { should validate_presence_of :land_area}
    #   it { should validate_presence_of :continental} - Got some weird google results about booleans,
    #   ask about validating presence of booleans in class. 
    end
end
