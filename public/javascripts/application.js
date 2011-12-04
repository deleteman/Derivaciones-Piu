// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function remove_fields(link) {

	$(link).prev("input[type=hidden]").val(true)
	$(link).parent(".fields").hide();
}

function add_field (link, association, content ) {
	var new_id  = new Date().getTime();
	var regexp = new RegExp("new_" + association , "g");
	
	$(link).parent().append(content.replace(regexp, new_id))
	$(".date-picker").trigger("set-date-picker");
}


$(document).ready(function() {
	$(".date-picker").trigger("set-date-picker");

	$(".delete-date-box").live('mouseover', function() {
		$(this).parent().addClass("hover-date-box");
	});

	$(".delete-date-box").live('mouseout', function() {
		$(this).parent().removeClass("hover-date-box");
	});

	$(".filtro_lista").live("change", function() {
		var lista_filtrable = $(".filtrable");
		filtrarLista(lista_filtrable, $(this).val());
	});

	$("#multiple-materias").live("change", function() {
		updateMateriasSeleccionadas($(this));
	});

	$("#select_all").live("click", function() {
		var checked = $(this).attr("checked") || false;
		$("input:checkbox:visible").attr("checked", checked);
	});

	$("#ver-attendance").live("click", function() {
		$(".general-view").hide();
		$(".attendance-sheet").show();
		$(this).hide();
		$("#ver-detalles").show();
		return false;
	});

	$("#ver-detalles").live("click", function() {
		$(".general-view").show();
		$(".attendance-sheet").hide();
		$(this).hide();
		$("#ver-attendance").show();
		return false;
	});


});

function updateMateriasSeleccionadas(select) {
		var opciones = $('option:selected', select);
		$("#derivaciones-seleccionadas li").remove();
		$("#derivaciones-seleccionadas").append("<li class=\"title\">Materias seleccionadas</li>");
		opciones.each(function(){
			$("#derivaciones-seleccionadas").append("<li>" + $(this).text() + "</li>");
		});

		$("#derivaciones-seleccionadas").append("<li>Total de materias: <b>" + opciones.length + "</b></li>");

}

function filtrarLista(lista, valor) {
	$("tr.data", lista).each(function() {
		var container = $(this);
		var index_value = "";
		$("td.index", container).each(function() {
			index_value += $(this).html() + " ";	
		});
		if(index_value.toLowerCase().indexOf(valor.toLowerCase()) == -1) {
			container.hide();
		} else {
			container.show();
		}
	});
}


$(".date-picker").live("set-date-picker",function() {
	$(".date-picker").datepicker({dateFormat:"dd-mm-yy",
								showOn:"button",
								buttonImage: "/images/calendar.gif",
								buttonImageOnly: true});

	//$(".date-picker").datepicker("option", $.datepicker.regional["es"]);
	$(".time-picker").timepicker();

});