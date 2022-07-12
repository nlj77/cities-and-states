class StateCitiesController < ApplicationController
    def index 
        @state = State.find(params[:id])
        @cities = @state.cities
    end
end