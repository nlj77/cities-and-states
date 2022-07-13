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

    it "when I visit the show page for states, I see a count of the number of children associated with this parent" do
        visit "/states/#{@colorado.id}"

        expect(page).to have_content("Colorado currently has 2 cities")
    end

    it "when I visit the show page for states, I see a link to the state's cities" do
        visit "/states/#{@colorado.id}"

        expect(page).to have_content("Colorado's cities")

        click_link('cities')

        expect(page).to have_current_path("/states/#{@colorado.id}/cities")
    end

    # User Story 12, Parent Update 

# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info
    it " when I visit the states show page, I can click a link to update state" do

        visit "/states/#{@colorado.id}"

        expect(page).to have_content("Update State")
    end
end