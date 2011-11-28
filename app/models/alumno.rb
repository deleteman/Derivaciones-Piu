class Alumno < ActiveRecord::Base
	has_many :derivacions

	validates :nombre, :presence => true, :length => {:minimum => 4, :too_short => "no valido" }

	def cantidad_derivaciones
		Derivacion.count(:conditions => "alumno_id = #{id}")
	end

end
