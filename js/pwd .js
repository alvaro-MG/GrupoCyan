function checkPassword(form) { 
    password1 = form.password1.value; 
    password2 = form.password2.value; 
    
    // If password not entered 
    if (password1 == '') 
    Swal.fire({
        title: 'Introduzca Una Contraseña',
        icon: 'error',
        confirmButtonText: 'OK'
      }) 
          
    // If confirm password not entered 
    else if (password2 == '') 
    Swal.fire({
        title: 'Por Favor, Confirme La Contraseña',
        icon: 'error',
        confirmButtonText: 'OK'
      })
          
    // If Not same return False.     
    else if (password1 != password2) { 
        Swal.fire({
            title: 'Las Contraseñas No Coinciden',
            icon: 'error',
            confirmButtonText: 'OK'
          })
          return false;  
    }

    // If same return True. 
    else  { 
        swal.fire({
            title: 'Resgistrado Con Éxito',
            icon: 'success',
          })
          return true;
    } 
}