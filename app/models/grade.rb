class Grade < ApplicationRecord
	validates :name, presence: true
	validates :name, uniqueness: true
	has_many :students

	def updatestatus
		if self.students.count> 1 and self.students.count<7
			self.update(status: true)
		end		
	end
end
