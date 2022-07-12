class State < ApplicationRecord
    has_many :cities

    validates_presence_of :name
    validates_presence_of :number_of_lakes
    validates_presence_of :biome
    validates_presence_of :land_area

    scope :order_by_created_at, -> {order(created_at: :desc)}

    def average_population
        self.cities.average(:population)
    end

    def self.sort_by_created_datetime 
        order(created_at: :desc)
    end
end