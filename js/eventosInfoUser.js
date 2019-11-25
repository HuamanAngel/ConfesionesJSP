var idPantalla1=document.getElementById("idBotContent1");
var idPantalla2=document.getElementById("idBotContent2");
var idPantalla3=document.getElementById("idBotContent3");
var classPopupInformacion=document.getElementsByClassName("opcionesConfesionConsulta");

var classNombreInformacion=document.getElementsByClassName("parrafoNombre");
var classApellidoInformacion=document.getElementsByClassName("parrafoApellido");
var classTelefonoInformacion=document.getElementsByClassName("parrafoTelefono");
var classSexoInformacion=document.getElementsByClassName("parrafoSexo");
var classUniversidadInformacion=document.getElementsByClassName("parrafoUniversidad");
var classUsuarioInformacion=document.getElementsByClassName("parrafoUsuario");
var classCostoInformacion=document.getElementsByClassName("parrafoCosto");

$(document).ready(function() {

	$('#pantalla1').click(function() {
        idPantalla1.classList.remove("active");
        idPantalla2.classList.remove("active");
        idPantalla3.classList.remove("active");        
    })
    $('#pantalla2').click(function() {

        idPantalla1.classList.add("active");
        idPantalla2.classList.add("active");
        idPantalla3.classList.remove("active");        

    })
    $('#pantalla3').click(function() {
        idPantalla1.classList.add("active");
        idPantalla2.classList.remove("active");
        idPantalla3.classList.add("active");        

    })
    $('.opcionesConfesionConsulta').click(function() {

        var idBotonInfo=$(this).attr('id');
        var Tnombre=classNombreInformacion[idBotonInfo].innerHTML;
        var Tapellido=classApellidoInformacion[idBotonInfo].innerHTML;
        var Ttelefono=classTelefonoInformacion[idBotonInfo].innerHTML;
        var Tsexo=classSexoInformacion[idBotonInfo].innerHTML;
        var Tuniversidad=classUniversidadInformacion[idBotonInfo].innerHTML;
        var Tusuario=classUsuarioInformacion[idBotonInfo].innerHTML;
        var Tcosto=classCostoInformacion[idBotonInfo].innerHTML;
        document.getElementById('idOverlayDetalles').classList.add('active');
        document.getElementById('idPopupDetalles').classList.add('active');
        document.formDetalles.nameNombre.value=Tnombre;
        document.formDetalles.nameApellido.value=Tapellido;
        document.formDetalles.nameTelefono.value=Ttelefono;
        document.formDetalles.nameSexo.value=Tsexo;
        document.formDetalles.nameUniversidad.value=Tuniversidad;
        document.formDetalles.nameUsuario.value=Tusuario;
        document.formDetalles.nameCosto.value=Tcosto;

    })
    $('.labelAceptar').click(function(){
        document.getElementById('idOverlayDetalles').classList.remove('active');
        document.getElementById('idPopupDetalles').classList.remove('active');        
    })
})