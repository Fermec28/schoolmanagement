class Signature < ApplicationRecord
	
	validates :name, presence: true
	validates :name, uniqueness: true
	has_and_belongs_to_many :students
	
	include Authority::Abilities
end
