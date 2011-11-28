class Materium < ActiveRecord::Base
	has_many :horario_materia, :foreign_key => "materia_id", :dependent => :destroy
	belongs_to :profesor
	has_many :derivacions, :foreign_key => "materia_id"
	has_many :exams, :foreign_key => "materia_id"

	accepts_nested_attributes_for :horario_materia, :allow_destroy => true

	def horarios
		@horarios = HorarioMaterium.find_all_by_materia_id id
	end
end
