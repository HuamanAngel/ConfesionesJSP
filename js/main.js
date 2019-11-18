/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

window.addEventListener('load',function(){
    document.getElementById('btniniciar').addEventListener('click',function(){
        var usuario = document.getElementById('txtuser').value;
        var contraseña = document.getElementById('txtpass').value;
        var bandera = false;
       
       if(usuario.length > 0 && contraseña.length > 0){
           bandera = true;
       }
       
       if(bandera){
           document.getElementById('forminicio').submit();
       }else{
           alert('Por favor rellena todos los campos');
       }
    });
});

window.addEventListener('load',function(){
    document.getElementById('btnregistrar').addEventListener('click',function(){
        var nombre = document.getElementById('nombre').value;
        var apellido = document.getElementById('apellido').value;
        var usuario = document.getElementById('usuario').value;
        var contraseña = document.getElementById('contraseña').value;
        var confirmacion = document.getElementById('confirmacion').value;
        var telefono = document.getElementById('telefono').value;
        var femenino = document.getElementById('f').value;
        var masculino = document.getElementById('m').value;
        var uni = document.getElementById('u').value;
        var pago = document.getElementById('p').value;
       
        
        var bandera = false;
       
       if(nombre.length > 0 && apellido.length > 0
               && usuario.length > 0 && contraseña.length > 0
               && confirmacion.length > 0 && telefono.length > 0){
           bandera = true;
       }
       
       if(femenino !== 'F'  && masculino !== 'M'){
           bandera = true;
       }

       
       if(bandera){
           document.getElementById('formregis').submit();
       }else{
           alert('Por favor rellena todos los campos');
       }
    });
});

