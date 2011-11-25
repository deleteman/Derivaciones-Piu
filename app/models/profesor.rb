class Profesor < ActiveRecord::Base
	validates :nombre, :presence => true, :length => {:minimum => 4, :too_short => "debe ser valido"}
end
