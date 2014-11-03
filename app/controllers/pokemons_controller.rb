class PokemonsController < ApplicationController
	
	def show
	end

	def capture
		@pokemon = Pokemon.find(params[:id])
		@pokemon.trainer = current_trainer
		@pokemon.save
		redirect_to root_path
	end

	def damage
		@pokemon = Pokemon.find(params[:id])
		@pokemon.health -=10
		@pokemon.save
		if @pokemon.health <= 0
	   		@pokemon.destroy
	   	end
		redirect_to trainer_path(@pokemon.trainer_id)
	end 

	def new
		@pokemon = Pokemon.new
	end

	def create 
		@pokemon = Pokemon.create(params.require(:pokemon).permit(:name))
		@pokemon.trainer = current_trainer
		@pokemon.health = 100
		@pokemon.level = 1
		if !@pokemon.save
			flash[:error] = @pokemon.errors.full_messages.to_sentence
		end
		redirect_to trainer_path(@pokemon.trainer_id)
		
   		
	end

end
