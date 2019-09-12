class CharacterController < ActionController::Base
    def show
        @character = Character.find(params[:id])
    end

    def edit
        @character = Character.find(params[:id])
    end

    def new
        @character = Character.new
    end

    def create
        @unit = Unit.find(params[:character][:unit_id])
        @character = Character.new({name: params[:character][:name], username: params[:character][:username], unit_id: params[:character][:unit_id], stat_build_id: params[:character][:stat_build_id], location_id: @unit.location_id})
        @character.save!
        redirect_to :root
    end

    def update
        @character = Character.find(params[:id])
        @character.update_attributes!({name: params[:character][:name], username: params[:character][:username], unit_id: params[:character][:unit_id], stat_build_id: params[:character][:stat_build_id]})
        redirect_to :root
    end
end