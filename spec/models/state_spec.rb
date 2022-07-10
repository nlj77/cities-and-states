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
        it 'can report the average population of the cities of a state' do 
            colorado = State.create!(name: 'Colorado', number_of_lakes:500, biome: 'High Desert', land_area: 104185)
            denver = colorado.cities.create!(name: 'Denver', capitol: true, population: 716000)
            grand_junction = colorado.cities.create!(name: 'Grand Junction', capitol: false, population: 62000)
            expect(colorado.average_population).to eq(389000)
    end
end
