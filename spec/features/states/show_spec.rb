require 'rails_helper'

RSpec.describe 'States cities index' do 
    before :each do
        @colorado = State.create!(name: 'Colorado', number_of_lakes:500, biome: 'High Desert', land_area: 104185)
        @denver = @colorado.cities.create!(name: 'Denver', capitol: true, population: 716000)
        @grand_junction = @colorado.cities.create!(name: 'Grand Junction', capitol: false, population: 62000)
    end
end