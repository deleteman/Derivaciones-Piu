class Derivacion < ActiveRecord::Base
	belongs_to :alumno
	belongs_to :materium

	validate :no_se_puede_derivar_mismo_alumno_y_materia

	def no_se_puede_derivar_mismo_alumno_y_materia
		if Derivacion.find_all_by_alumno_id_and_materia_id(alumno_id,materia_id).size > 0
			errors.add(:base, "Este alumno ya esta derivado para esta materia")
		end
	end

	def materia
		Materium.find(materia_id)
	end

	def alumno_nombre
		if !alumno.nil?
			alumno.nombre
		else 
			""
		end
	end

	def alumno_nombre=(value)
		alumno.nombre=value
	end

	def horarios
		materium.horarios
	end
end
