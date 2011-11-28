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

});


$(".date-picker").live("set-date-picker",function() {
	$(".date-picker").datepicker({dateFormat:"dd-mm-yy",
								showOn:"button",
								buttonImage: "/images/calendar.gif",
								buttonImageOnly: true});

	$(".time-picker").timepicker();

});