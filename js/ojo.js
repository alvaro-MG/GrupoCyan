function mostrarPassword(){
		var cambio = document.getElementById("txtPassword");
		if(cambio.type == "password"){
			cambio.type = "text";
			$('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
		}else{
			cambio.type = "password";
			$('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
		}
	} 
	
	$(document).ready(function () {
	//CheckBox mostrar contraseña
	$('#ShowPassword').click(function () {
		$('#Password').attr('type', $(this).is(':checked') ? 'text' : 'password');
	});
});
function mostrarPassword2(){
		var cambio = document.getElementById("txtPassword2");
		if(cambio.type == "password"){
			cambio.type = "text";
			$2('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
		}else{
			cambio.type = "password";
			$2('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
		}
	} 
	
	$2(document).ready(function () {
	//CheckBox mostrar contraseña
	$2('#ShowPassword').click(function () {
		$2('#Password').attr('type', $2(this).is(':checked') ? 'text' : 'password');
	});
});