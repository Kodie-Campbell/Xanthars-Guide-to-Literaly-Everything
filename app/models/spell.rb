class Spell < ActiveRecord::Base
	validates :name, presence: true
	validates :name, uniqueness: { case_sensitive: false }
	validates :Description, presence: true
	validates :distance, numericality: { message: " Cant be blank. Please select or enter a range for your spell" }, unless: :Range
	validates :Range, presence: true, unless: :distance
	alias_attribute :cast_time, :"cast time"
	alias_attribute :Other_Components, :"Other Components"
end