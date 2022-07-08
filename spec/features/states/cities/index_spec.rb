require 'rails_helper'

RSpec.describe 'States cities index' do 
    before :each do
        @colorado = State.create!(name: 'Colorado')
        @purple = @prince.songs.create!(title: 'Purple Rain', length: 846, play_count: 8999)
        @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 300, play_count: 7550)

    end
    it 'shows all of the titles of the songs for the artist' do 

        visit "/artists/#{@prince.id}/songs"

        expect(page).to have_content(@purple.title)
        expect(page).to have_content(@beret.title)
    end

    it "links to each songs show page" do 
        visit "/artists/#{@prince.id}/songs"

        click_on @purple.title

        expect(current_path).to eq("/songs/#{@purple.id}")
    end

    it 'shows the average song length for the artist' do
        visit "/artists/#{@prince.id}/songs"

        expect(page).to have_content("Average Song Length for Prince: 573")
    end
end