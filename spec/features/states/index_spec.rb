require 'rails_helper'
RSpec.describe 'States index' do 
    it 'shows every added state' do
        @colorado = State.create!(name: 'Colorado', number_of_lakes:500, biome: 'High Desert', land_area: 104185)
        visit "/states"

        expect(page).to have_content(@colorado.name)
    end
end