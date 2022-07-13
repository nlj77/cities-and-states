# User Story 11, Parent Creation 

# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.
require 'rails_helper'

RSpec.describe 'the State creation' do
    it 'links to the new page from the states index' do
        visit '/states'
        expect(page).to have_content("New State")
        click_link("New State")
        expect(current_path).to eq("/states/new")
    end

    it 'can create a new state' do
        visit '/states/new'

        fill_in('name', with: 'Test')

        fill_in('land_area', :with => 400000)
        fill_in('number_of_lakes', :with => 1)
        fill_in('biome', :with => "Crater")
        select "Yes", from: 'continental'
        click_on('Create State')

        expect(current_path).to eq("/states")
        expect(page).to have_content("Test")
    end
end