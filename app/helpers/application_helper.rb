module ApplicationHelper

	def link_to_add_fields(name, f, association)
		new_object = f.object.class.reflect_on_association(association).klass.new
		fields = f.fields_for(association, new_object, :child_index => "new_#{association}}") do |builder|
			render(association.to_s.singularize + "_fields", :f => builder)
		end
		link_to_function(name, ("add_field(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
	end

	def write_hour_only date_val
		date_val.hour.to_s + ":" + date_val.min.to_s
	end

	def format_latin_date date_val
		date_val.strftime('%d/%m/%Y')
	end


	def filtro_por_texto
		"#{label_tag("Filtro: ")} #{text_field_tag(:filtro, nil,:placeholder => "Escriba aqui para filtrar la lista", :class => "filtro_lista") }".html_safe

	end
end
