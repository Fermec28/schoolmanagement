class Grade < ApplicationRecord
	
	validates :name, presence: true
	validates :name, uniqueness: true
	has_many  :students

	def updatestatus
		if self.students.count> 1 
			self.update(status: true)
		else
			self.update(status: false)
		end		
	end
end
