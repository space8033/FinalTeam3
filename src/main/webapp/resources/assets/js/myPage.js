$(document).ready(function(){
	var nowEmpNo = $("#nowEmpNo").val();
	console.log(nowEmpNo);
    var colors = ["bg-label-success", "bg-label-primary", "bg-label-warning", "bg-label-danger", "bg-label-info", "bg-label-dark", "bg-label-secondary"];
    var randomClass = colors[nowEmpNo % 7];
    $('#nameProfile').addClass(randomClass);
});