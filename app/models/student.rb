class Student < ApplicationRecord
	validates :name, presence: true
	validates :surname, presence: true
	validates :adress, presence: true
	validates :mail, presence: true
	validates :mail, uniqueness: true

	has_one :grade
	has_and_belongs_to_many :signatures
end
