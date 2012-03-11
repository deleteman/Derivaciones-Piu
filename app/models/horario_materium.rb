class HorarioMaterium < ActiveRecord::Base
	belongs_to :materium

	def materia
		Materium.find(materia_id)
	end
end
