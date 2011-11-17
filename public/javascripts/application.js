// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function remove_fields(link) {

	$(link).parent("input[type=hidden]").value=1
	$(link).parent(".fields").hide();
}

function add_field (link, association, content ) {
	var new_id  = new Date().getTime();
	var regexp = new RegExp("new_" + association , "g");
	
	$(link).parent().prepend(content.replace(regexp, new_id))
	$(".date-picker").trigger("set-date-picker");
}


$(document).ready(function() {
	$(".date-picker").trigger("set-date-picker");
});
$(".date-picker").live("set-date-picker",function() {
	$(".date-picker").datepicker({dateFormat:"dd-mm-yy",
								showOn:"button",
								buttonImage: "/images/calendar.gif",
								buttonImageOnly: true});

	$(".time-picker").timepicker();

});