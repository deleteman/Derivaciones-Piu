module AlumnosHelper

	def puede_asistir_examen(alumno, fecha)
		cant_derivaciones = alumno.cantidad_derivaciones
		if cant_derivaciones <= 3
			if fecha <= Date.new(2011, 12, 31)
				true
			else
				false
			end
		elsif cant_derivaciones > 3 && cant_derivaciones <= 6
			if fecha >= Date.new(2012, 2, 1) 
				true
			else 
				false
			end
		else
			true
		end
	end
end
