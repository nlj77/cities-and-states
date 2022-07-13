require 'rails_helper'
RSpec.describe 'States index' do 
    it 'shows every added state' do
        @colorado = State.create!(name: 'Colorado', number_of_lakes:500, biome: 'High Desert', land_area: 104185)
        visit "/states/#{@colorado.id}"

        expect(page).to have_content(@colorado.name)
    end

    it 'orders the index page by the most recently created first' do
        @colorado = State.create!(name: 'Colorado', number_of_lakes: 500, biome: 'High Desert', land_area: 104185, continental: true)
        @florida = State.create!(name: 'Florida', number_of_lakes: 1700, biome: 'Tropical and subtropical moist broadleaf forests', land_area: 65758, continental: true)
        @ohio = State.create!(name: 'Ohio', number_of_lakes: 900, biome: 'Temperate Deciduous Forest', land_area: 65758, continental: true)

        visit '/states'

        within '#state-0' do
            expect(page).to have_content("Colorado")
        end
        within '#state-1' do
            expect(page).to have_content("Florida")
        end
        within '#state-2' do
            expect(page).to have_content("Ohio")
        end
    end

    it "see a link to create a new State record, 'New State'"do
        @colorado = State.create!(name: 'Colorado', number_of_lakes: 500, biome: 'High Desert', land_area: 104185, continental: true)
        @florida = State.create!(name: 'Florida', number_of_lakes: 1700, biome: 'Tropical and subtropical moist broadleaf forests', land_area: 65758, continental: true)
        @ohio = State.create!(name: 'Ohio', number_of_lakes: 900, biome: 'Temperate Deciduous Forest', land_area: 65758, continental: true)

        visit '/states'
        expect(page).to have_content("New State")
        click_link("New State")
        expect(page).to have_current_path("/states/new")
    end
end