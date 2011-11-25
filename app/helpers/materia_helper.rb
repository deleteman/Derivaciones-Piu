module MateriaHelper

	def to_ordinal n
		ordinal = ""
		if n == 1
			ordinal = "1ero"
		elsif n == 2
			ordinal = "2do"
		elsif n == 3
			ordinal = "3ero"
		end
		ordinal
	end

	def select_nivel 
		select_tag("materium[nivel]", '<option value="1">1ero</option><option value="2">2do</option><option value="3">3ero</option>'.html_safe)
	end
end
