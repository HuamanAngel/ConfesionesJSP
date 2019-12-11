var overlay=document.getElementById('overlayId');
var popup=document.getElementById('popupId');

var overlayConfes=document.getElementById('overlayIdConfes');
var popupConfes=document.getElementById('popupIdConfes');

var classParrafoConfesion=document.getElementsByClassName("classObtenerConfes");
var classParrafoPago=document.getElementsByClassName("Fpagoprecio");

var texto;
var valorTexto;

var costo;
var costoPago;
var costoVendedor;

$(document).ready(function(){

	$('.open-popup').click(function(){
    	var idBoton=$(this).attr('id');
        var texto1=classParrafoConfesion[classParrafoConfesion.length-idBoton-1].innerHTML;
        var texto2=classParrafoPago[classParrafoPago.length-idBoton-1].innerHTML;
        var regex = /(\d+)/g;
        var cadena=texto1;
        var valorTexto=cadena.match(regex)-1+1;
        var idBotonAux="A"+idBoton;
        var idPagoRepetido="B"+idBoton;
        

        var idParrafoUser=document.getElementById(idBotonAux);
        var idParrafoPagoRepetido=document.getElementById(idPagoRepetido);
        
        var textoIdUser=idParrafoUser.innerHTML;
        var textoIdPagoRepetido=idParrafoPagoRepetido.innerHTML;

        var idParrafoOcultoUser=document.getElementById("idUsuarioNoTocar").innerHTML;
        var idParrafoOcultoPago=document.getElementById("idPagoNoTocar").innerHTML;

        

        document.formPago2.inputPago2.value=texto1;
        document.formPago2.inputValor2.value=texto2;
        document.formPago2.numConfesionOculto.value=valorTexto;
        document.formPago2.nameCostoId.value=texto2;
        document.formPago2.nameUsuarioPagar.value=textoIdUser;
        
        var valor1=texto2.substring(2).trim();
        var valor2=idParrafoOcultoPago.trim();
        valor1=valor1.toString();
        valor2=valor2.toString();
        valor1=parseFloat(valor1);
        valor2=parseFloat(valor2);
        
        if(idParrafoOcultoUser!=-1){
            if(parseInt(idParrafoOcultoUser.trim().toString())!=parseInt(textoIdUser.trim().toString())){
            	if(valor2>=valor1){
            		if(textoIdPagoRepetido==0){
                		document.formPago2.form2Submit.disabled=false;            		
                        overlay.classList.add('active');
                        popup.classList.add('active');            			
            		}else{
            			alert("Ya pagaste esta confesion, revisar en tu cuenta de usuario");
                    	document.formPago2.form2Submit.disabled=true;    	            		            			
            		}

            	}else{
                	alert("Dinero insuficiente");
                	document.formPago2.form2Submit.disabled=true;    	            		
            	}
            }else{
            	alert("No puedes revelar porque tu eres el que se confeso");
            	document.formPago2.form2Submit.disabled=true;    	
            }        	
        }else{
        	alert("Registrate para revelar confesiones");
        	document.formPago2.form2Submit.disabled=true;    	
        }

        /*        for(var i=0;i<classObtenerConfesion.length;i++){

        	caracterUnidad=classObtenerConfesion[i].innerHTML;

        	caracterUnidad=caracterUnidad.charAt(11)+caracterUnidad.charAt(12)+caracterUnidad.charAt(13);
        }
*/
    })
})

function validacionFormulario(){
	var valid;

	valid=document.confesarInfo.TAconfesion.value;
	
	if(valid>399){
		alert("Se paso los caracter maximos permitidos : 399 ");
		return false;
	}
	return true;
}

function cerrarVentana(){
    overlay.classList.remove('active');
    popup.classList.remove('active');
}
function abrirVentanaConfesar(){
    texto=document.orley.TAconfesionAUX.value;
    document.getElementById('idTA').value=texto;  

    var usuarioAnonimoConfesar=document.getElementById("existeUsuario").innerHTML;
    if(usuarioAnonimoConfesar==-1){
    	alert("Tienes que registrarte para confesarte");
    }else{
        overlayConfes.classList.add('active');
        popupConfes.classList.add('active');    	
    }
    
}

function cerrarVentanaConfesar(){
    overlayConfes.classList.remove('active');
    popupConfes.classList.remove('active');
}

function colocarCosto(){
    costo=document.confesarInfo.precio1.value;
    costoPago=costo*110/100;
    costoVendedor=costo*10/100;
    
    document.confesarInfo.precio2.value=costoPago.toFixed(2);
    document.confesarInfo.precio3.value=costoVendedor.toFixed(2);
    document.getElementById("idPrecio2").value=costoPago.toFixed(2);
    document.getElementById("idPrecio3").value=costoVendedor.toFixed(2);
    
    if(costo>=0 && costo<5){
    	//document.getElementById('textoParrafo').innerHTML=" ";
    	if(costo!=0){
        	document.confesarInfo.confesarSubmit.disabled=false;
        	//document.getElementById('textoParrafo').innerHTML=" ";

    	}else{
        	document.confesarInfo.confesarSubmit.disabled=true;    		
        	alert("No se puede colocar el valor de 0");
        	//document.getElementById('textoParrafo').innerHTML="No se puede colocar el valor de 0";
    	}
    }else{
    	document.confesarInfo.confesarSubmit.disabled=true;
    	alert("No se puede colocar valores negativos o mayores que 5");
    	//document.getElementById('textoParrafo').innerHTML="No se puede colocar valores negativos o mayores que 99";
    }
    
    
}