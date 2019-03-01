class SpellsController < ApplicationController
	before_action :authenticate_user!

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

	def show
		@spell = Spell.find( params[:id])
	end

	def edit
		@spell = Spell.find( params[:id])
		@spell
	end

	def update
		@spell = Spell.find( params[:id])
		if @spell.update_attributes(spell_params)
			flash[:success] = "Spell Updated!"
			redirect_to spell_path(id: params[:id])
		else 
			render action: :edit
		end
	end

	private
		def spell_params
			params.require(:spell).permit(:name, :Level, :school, :Bard, :Cleric, :Druid, :Paladin, :Ranger, :Sorcerer, :Warlock, :Wizard, :'cast time', :Range, :distance, :Verbal, :Somatic, :Material, :'Other Components', :Duration, :Attack, :Source, :Description, :Concentration, :Ritual, :Area, :Page)
		end
end
