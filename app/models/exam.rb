class Exam < ActiveRecord::Base
	belongs_to :materium, :foreign_key => "materia_id"

	validates :fecha, :presence => true

	def materia
		materium
	end
end
