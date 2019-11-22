var overlay=document.getElementById('overlayId');
var popup=document.getElementById('popupId');

var overlayConfes=document.getElementById('overlayIdConfes');
var popupConfes=document.getElementById('popupIdConfes');

var texto;
var valorTexto;

var costo;
var costoPago;
var costoVendedor;

function abrirVentana(){
    overlay.classList.add('active');
    popup.classList.add('active');
}
function cerrarVentana(){
    overlay.classList.remove('active');
    popup.classList.remove('active');
}
function abrirVentanaConfesar(){
    texto=document.orley.TAconfesionAUX.value;

    overlayConfes.classList.add('active');
    popupConfes.classList.add('active');
    document.getElementById('idTA').value=texto;
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
    if(costo>=0 && costo<100){
    	document.getElementById('textoParrafo').innerHTML=" ";
    	if(costo!=0){
        	document.confesarInfo.confesarSubmit.disabled=false;
        	document.getElementById('textoParrafo').innerHTML=" ";

    	}else{
        	document.confesarInfo.confesarSubmit.disabled=true;    		
        	document.getElementById('textoParrafo').innerHTML="No se puede colocar el valor de 0";
    	}
    }else{
    	document.confesarInfo.confesarSubmit.disabled=true;
    	document.getElementById('textoParrafo').innerHTML="No se puede colocar valores negativos o mayores que 99";
    }
    
    
}