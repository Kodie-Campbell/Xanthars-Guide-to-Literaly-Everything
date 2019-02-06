class SpellsController < ApplicationController
	def new
		@spell = Spell.new
	end

	def create
		@spell = Spell.new(spell_params)
		if @spell.save
			flash[:success] = "Spell Saved!"
			redirect_to new_spell_path
		else
			flash[:danger] = @spell.errors.full_messages.join(", ")
			redirect_to new_spell_path	
		end
	end

	def index
		@spells = Spell.order("name")
		
	end 
	private
		def spell_params
			params.require(:spell).permit(:name, :Level, :school, :Bard, :Cleric, :Druid, :Paladin, :Ranger, :Sorcerer, :Warlock, :Wizard, :'cast time', :Range, :distance, :Verbal, :Somatic, :Material, :'Other Components', :Duration, :Attack, :Source, :Description)
		end
end
