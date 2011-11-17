class Derivacion < ActiveRecord::Base
	belongs_to :alumno
	belongs_to :materium

	def materia
		Materium.find(materia_id)
	end

	def horarios
		materium.horarios
	end
end
