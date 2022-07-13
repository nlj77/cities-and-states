class StatesController < ApplicationController 
    def index
        @states = State.all #.order(created_at: :desc)
    end

    def show
        @state = State.find(params[:id])
    end

    def new
        # @state_create = State.new
    end

    def create 
        State.create(state_params)
        
        redirect_to "/states"  
    end

    def edit
        @state = State.find(params[:id])
    end
    
    def update
        state = State.find(params[:id])
        state.update(state_params)
        redirect_to '/states'
    end
    private
    def state_params
        params.permit(:name, :continental, :land_area, :number_of_lakes, :biome)
        # params.permit(:continental)
        # params.permit(:land_area)
        # params.permit(:number_of_lakes)
    end
end