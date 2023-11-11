$(document).ready(function(){
    var colors = ["bg-label-success", "bg-label-primary", "bg-label-warning", "bg-label-danger", "bg-label-info", "bg-label-dark", "bg-label-secondary"];
    var randomClass = colors[Math.floor(Math.random() * colors.length)];
    $('#nameProfile').addClass(randomClass);
});