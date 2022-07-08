class State < ActiveRecord::Base 
    has_many :cities

    validates_presence_of :name
    validates_presence_of :number_of_lakes
    validates_presence_of :biome
    validates_presence_of :land_area
end