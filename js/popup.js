var btnAbrirPopup=document.getElementById("botonIdOpen");
var overlay=document.getElementById('overlayId');
var popup=document.getElementById('popupId');
var btnCerrarPopup=document.getElementById('btnCerrar');

var numeroConfesion=document.getElementById('numConfesionId');
var overlayConfes=document.getElementById('overlayIdConfes');
var popupConfes=document.getElementById('popupIdConfes');

function abrirVentana(){
    overlay.classList.add('active');
    popup.classList.add('active');
    
}
function cerrarVentana(){
    overlay.classList.remove('active');
    popup.classList.remove('active');

}
function abrirVentanaConfesar(){
    overlayConfes.classList.add('active');
    popupConfes.classList.add('active');
}
function cerrarVentanaConfesar(){
    overlayConfes.classList.remove('active');
    popupConfes.classList.remove('active');

}