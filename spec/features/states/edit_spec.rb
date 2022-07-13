require 'rails_helper'

RSpec.describe 'the state edit' do
    it 'links to the edit page' do
        @test_state = State.create!(name: 'Colorado', number_of_lakes:500, biome: 'High Desert', land_area: 104185, continental: true)

        visit "/states/#{@test_state.id}"

        click_on "Update State"
        # #{@test_state.name}

        expect(current_path).to eq("/states/#{@test_state.id}/edit")
    end

    it 'can edit the state' do
        @test_state = State.create!(name: 'Blormdon', number_of_lakes:500, biome: 'High Desert', land_area: 104185, continental: true)
        visit "/states"
        expect(page).to have_content('Blormdon')
        visit "/states/#{@test_state.id}"
        click_on 'Update State'
        fill_in 'name', with: 'Blormdom'
        fill_in('land_area', :with => 350000)
        fill_in('number_of_lakes', :with => 400)
        fill_in('biome', :with => "Crater")
        select "Yes", from: 'continental'
        click_on('Update')
        expect(current_path).to eq("/states")
        expect(page).to have_content('Blormdom')
    end
end
