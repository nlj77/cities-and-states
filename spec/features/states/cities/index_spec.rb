require 'rails_helper'

RSpec.describe 'States cities index' do 
    before :each do
        @colorado = State.create!(name: 'Colorado', number_of_lakes:500, biome: 'High Desert', land_area: 104185)
        @denver = @colorado.cities.create!(name: 'Denver', capitol: true, population: 716000)
        @grand_junction = @colorado.cities.create!(name: 'Grand Junction', capitol: false, population: 62000)
    end
    it 'shows all of the names of the cities for the state' do 

        visit "/states/#{@colorado.id}/cities"

        expect(page).to have_content(@denver.name)
        expect(page).to have_content(@grand_junction.name)
    end

    # it "links to each cities show page" do 
    #     visit "/states/#{@colorado.id}/cities"

    #     click_on @denver.name

    #     expect(current_path).to eq("/cities/#{@denver.id}")
    # end

    # it 'shows the average population of the entered cities for the state' do
    #     visit "/states/#{@colorado.id}/cities"

    #     expect(page).to have_content("Average Population of given cities for Colorado: 389000.0")
    # end
end