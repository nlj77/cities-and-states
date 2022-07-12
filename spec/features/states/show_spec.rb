require 'rails_helper'

RSpec.describe 'States cities index' do 
    before :each do
        @colorado = State.create!(name: 'Colorado', number_of_lakes:500, biome: 'High Desert', land_area: 104185, continental: true)
        @denver = @colorado.cities.create!(name: 'Denver', capitol: true, population: 716000)
        @grand_junction = @colorado.cities.create!(name: 'Grand Junction', capitol: false, population: 62000)
    end

    it "can visit /parents/:id and show the attributes of that parent id" do

        visit "/states/#{@colorado.id}"
        expect(page).to have_content("Average Population of given cities for Colorado: 389000.0")
        expect(page).to have_content("Biome of Colorado: High Desert")
        expect(page).to have_content("Is the state part of the continental US? Colorado: true") 
        expect(page).to have_content("Colorado has 500 lakes")
        expect(page).to have_content("Colorado has 104185.0 square miles of land")
        
        # expect(page).to have_content
    end
end