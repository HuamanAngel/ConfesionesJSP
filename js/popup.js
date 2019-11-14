var btnAbrirPopup=document.getElementById('btnAbrir');
var overlay=document.getElementById('overlayId');
var btnCerrarPopup=document.getElementById('btnCerrar');


btnAbrirPopup.addEventListener('click',function(){
    overlay.classList.add('active');
});

btnCerrarPopup.addEventListener('click',function(){
    overlay.classList.remove('active');
});