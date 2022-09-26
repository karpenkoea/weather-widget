class CharactersController < ApplicationController
  def new
    @character = Character.new
  end

  def create
    @character = Character.new character_params
    if @character.save
      redirect_to characters_path
    else
      render :new
    end
  end

  def index
    @characters = Character.order created_at: :desc
    @response =  Character.get_weather("Kazan")
  end

  def weather
    @char = Character.find(params[:id])
  end


  private

  def character_params
    params.require(:character).permit(:name)
  end
end
