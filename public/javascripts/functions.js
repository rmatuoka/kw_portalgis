function CadFocus(id, focus){
	if(focus){
		$("#" + id).addClass("DataLabelOn");
	}
	else{
		$("#" + id).removeClass("DataLabelOn");
	}
}