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
		$('#password1').attr('type', $(this).is(':checked') ? 'text' : 'password');
	});
});
function mostrarPassword2(){
		var cambio2 = document.getElementById("txtPassword2");
		if(cambio2.type == "password"){
			cambio2.type = "text";
			$('.icon2').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
		}else{
			cambio2.type = "password";
			$('.icon2').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
		}
	} 
	
	$(document).ready(function mostrarPassword2 () {
	//CheckBox mostrar contraseña
	$('#ShowPassword').click(function mostrarPassword2() {
		$('#Password').attr('type', $(this).is(':checked') ? 'text' : 'password');
	});
});