<%@page import="operacionesBasicas.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<%@page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
	<title>Confe$ione$</title>
	
	<meta http-equiv=”Content-Type” content=”text/html; charset=ISO-8859-1″ />
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" href="css/estiloPopup.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
	
</head>
<body>
	
	<header>
		<div class="topbar">
			<div class="logo">
				<!--Cambiar imagen-->
				<a href="index.jsp"><img src="img/Confes.png" alt="Confe$ione$"></a>
			</div>
			<nav class="navegar">
					<a href="">Trending</a>
					<a href="">Recientes</a>
					<a href="">Top</a>
					<a href="">Antiguos</a>
			</nav>
			<div class="login">
			<!-- Session -->
			<%
				
				List<String> listaDatos=(List<String>)session.getAttribute("DatosUser");
				if(listaDatos==null){
					out.println("<a href='login/login.jsp'>Login</a>");
					out.println("<a href='login/registro.jsp'>Registrarse</a>");
				}else{
					out.println("<a href='login/infoUser.jsp'>"+listaDatos.get(5)+"</a>");
					out.println("<a href='login/infoUser.jsp'>"+"S/"+""+listaDatos.get(9)+"</a>");
					out.println("<a href='login/loginOff.jsp'>Cerra Sesion</a>");	
				}
			%>
			<p id="idUsuarioNoTocar" style='display:none;'><%if(listaDatos!=null){out.println(Integer.parseInt(listaDatos.get(0)));}else{out.println(-1);}%></p>
			<p id="idPagoNoTocar" style='display:none;'><%if(listaDatos!=null){out.println(Float.parseFloat(listaDatos.get(9)));}else{out.println(-1);}%></p>
			
			<!-- Fin de session -->
			<!-- Base de datos de las Confesiones -->
			
		
			<!-- Fin Base de datos de las confesiones -->
			
			</div>
		</div>
	</header>

	<div class="cuerpo">
	
		<form class="filtro" action="index.jsp" method="post">
			<section class="instituciones-section">
				<label for="instituciones">Filtrar por institución: </label>
				<select id="instituciones" name="filtro-institucion">
					<option value="all">Todos</option>
					<option value="unmsm">UNMSM</option>
					<option value="pucp">PUCP</option>
					<option value="uni">UNI</option>
					<option value="unalm">UNALM</option>
					<option value="upc">UPC</option>
					<option value="upn">UPN</option>
					<option value="unfv">UNFV</option>
					<option value="unac">UNAC</option>
				</select>
			</section>

			<section class="ordenar-section">
				<label for="ordenar">Ordenar por: </label>
				<select id="ordenar" name="ordenar">
					<option value="antiguedad">Antiguedad</option>
					<option value="likes">Likes</option>
					<option value="mas-pagados">Mas pagados</option>
				</select>
			</section>

			<section class="filtro-submit">
				<input type="submit" name="Aceptar" value="Filtrar">
			</section>
		</form>
		
		<main class="confesiones">
		<!-- Popup -->
		 <div class="overlayConfes" id="overlayIdConfes">
        
            <div class="popupConfes" id="popupIdConfes">
                <a href="#" align="center" class="cerrar-popup" id="btnCerrarConfes" onclick="cerrarVentanaConfesar();" ><img class="classIcon" src="img/closeIcon.png" style="max-width: 16px; max-height: 16px; padding: 5px;"></a>
                <h2 align="center" >Informacion</h2>
                <form name="confesarInfo" align="center" class="formClass"action="indexOff.jsp" method="post">
					<div class="tablaClase">
							<p id="existeUsuario" style="display:none;"><%if(listaDatos==null){out.println(-1);}else{out.println(1);} %></p>
							<input type="hidden" name="TAconfesion" id="idTA">
                            <label class="labelPop1">Precio de la confesion : S/</label>
                            <input class="entrada1" name="precio1" type="text" value="10.00" onblur="colocarCosto();">
                            <br>
                            <label class="labelPop1">El comprador paga : S/</label>
                            <input class="entrada1" name="precio2" type="text" id="idPrecio2" value="11.00"  disabled>
                            <br>
                            <label class="labelPop1">Se retiene : S/</label>
                            <input class="entrada1" name="precio3" type="text" id="idPrecio3" value="1.00"  disabled> 
                            <br>
                            <label class="labelPop1">Esta seguro que desea continuar?</label>
                            <input class="entrada1" type="checkbox" >Si
                            <br>
                            <label class="labelPop1" name="informacionP"></label>
                            <label class="labelPop1"></label><input type="submit" value="Confesar" name="confesarSubmit" onsubmit="return validacionFormulario() "disabled>
					</div>
                </form>  
            </div>
        </div>
		
		<!-- Fin Popup -->
		
			<!--Proceso de session-->
			
		
			<!--Proceso de session-->
			<!--Cuadro de texto mejorado-->
			<section id="confe3" class="Ctexto">
				<div class="confes-header">
					<h2>Confesion   <% List<String> info=(List<String>)session.getAttribute("DatosUser");if(info==null){out.println("<label class='etiquetaName'>Anonimo</label>"+ "     <label class='etiquetaName'>UNMSM</label>     "+"<label class='etiquetaName'>No detectable</label>" );}else{out.println("<label class='etiquetaName'>"+info.get(5) + "</label>     <label class='etiquetaName'>" + info.get(4)+"</label>"+"     <label class='etiquetaName'>Detectable</label>");}%></h2>
					<hr>
				</div>

				<form action="index.jsp" name="orley" method="post">
					<textarea name="TAconfesionAUX" wrap="Hard" placeholder="Confiesate" ></textarea>
				</form>
				<div class="confes-footer">
				<!--<span class="p">Precio: </span> <span class="precio">S/ 10.00</span>-->
				<button style="margin-right:10px;" id="botonIdOpen" class="open-popup2" onclick="abrirVentanaConfesar();" >Confesar</button>

				</div>

			</section>
			
			<!--Fin Cuadro de texto mejorado-->
			
			<!--Cuadro de resultado-->	
			
			<%		
				ArrayList<String> allConfesion;
				ArrayList<String> allEtiqueta;
				ArrayList<Integer> allIdUsuarios;
				ArrayList<Float> allPago;
			
				String Pago=" ";
				String filtro =null;
				String ordenar=null;
				ConexionComentarios g4=new ConexionComentarios();
				filtro=request.getParameter("filtro-institucion");
				String filtro2;
				filtro2=filtro;
				ordenar=request.getParameter("");
				g4.EvaluarFecha(filtro);
				/*Saber si ya se pago*/
				ArrayList<Integer> pagoRepetido;
				ConsultaUsuario consult=new ConsultaUsuario();
				if(info!=null){
					consult.confesionesDeUsuario(Integer.parseInt(info.get(0)));					
				}else{
					consult.confesionesDeUsuario(-1);										
				}
				if(filtro==null){
					filtro2="all";
				}
				consult.setFiltro(filtro2);
				consult.conexionConsulta();
				if("all".equals(filtro2)){
					pagoRepetido=consult.geEsRepetidoPagoAll();
				}else{
					pagoRepetido=consult.getEsRepetidoPago();
				}
				/*Fin Saber si ya se pago*/
				if(filtro==null){
					g4.EvaluarFecha("all");
				}
				
				
				
				g4.Conectar();
				
				allConfesion=g4.getSalidaConfesiones();
				allEtiqueta=g4.getSalidaInstitucion();
				allIdUsuarios = g4.getSalidaUsuarios();
				allPago = g4.getSalidaPago();
				
					
				try{
					int LSindice=allConfesion.size();
					String Setiqueta="No encontrado";
					if(filtro==null || "all".equals(filtro)){
						LSindice=g4.getSalidaConfesiones().size();
						allIdUsuarios = g4.getSalidaUsuarios();						
						allConfesion = g4.getSalidaConfesiones();
						allPago = g4.getSalidaPago();
					}
					if("unmsm".equals(filtro)){
						Setiqueta="UNMSM";
						LSindice=g4.getSalidaUnmsm().size();
						allIdUsuarios = g4.getSalidaUsuariosUnmsm();
						allConfesion = g4.getSalidaUnmsm();
						allPago = g4.getSalidaPago();

					}
					if("pucp".equals(filtro)){
						Setiqueta="PUCP";
						LSindice=g4.getSalidaPucp().size();
						allIdUsuarios = g4.getSalidaUsuariosPucp();
						allConfesion = g4.getSalidaPucp();
						allPago = g4.getSalidaPago();

					}

					if("uni".equals(filtro)){
						Setiqueta="UNI";
						LSindice=g4.getSalidaUni().size();
						allIdUsuarios = g4.getSalidaUsuariosUni();
						allConfesion = g4.getSalidaUni();
						allPago = g4.getSalidaPago();

					}
					if("unalm".equals(filtro)){
						Setiqueta="UNALM";
						LSindice=g4.getSalidaUnalm().size();
						allIdUsuarios = g4.getSalidaUsuariosUnalm();
						allConfesion = g4.getSalidaUnalm();
						allPago = g4.getSalidaPago();

					}

					if("upc".equals(filtro)){
						Setiqueta="UPC";
						LSindice=g4.getSalidaUpc().size();
						allIdUsuarios = g4.getSalidaUsuariosUpc();
						allConfesion = g4.getSalidaUpc();
						allPago = g4.getSalidaPago();

					}
					if("upn".equals(filtro)){
						Setiqueta="UPN";
						LSindice=g4.getSalidaUpn().size();
						allIdUsuarios = g4.getSalidaUsuariosUpn();
						allConfesion = g4.getSalidaUpn();
						allPago = g4.getSalidaPago();

					}
					if("unfv".equals(filtro)){
						Setiqueta="UNFV";
						LSindice=g4.getSalidaUnfv().size();
						allIdUsuarios = g4.getSalidaUsuariosUnfv();
						allConfesion = g4.getSalidaUnfv();
						allPago = g4.getSalidaPago();

					}	

					if("unac".equals(filtro)){
						Setiqueta="UNAC";
						LSindice=g4.getSalidaUnac().size();
						allIdUsuarios = g4.getSalidaUsuariosUnac();
						allConfesion = g4.getSalidaUnac();
						allPago = g4.getSalidaPago();

					}
					
					String header=" ";
					String Sauxiliar=" ";
					String Sfecha=" ";
					float Fpago=0;
					int Sid=1;
					if(allConfesion!=null){
						int NombreValor=0;
						for(int i=LSindice-1;i>-1;i--){
							Fpago=allPago.get(i);

							Sauxiliar=(String)allConfesion.get(i);
							Sid=(int)allIdUsuarios.get(i);
							Sfecha=g4.getSalidaFecha().get(i);
							//Etiqueta de las confesiones//
							if(filtro==null || "all".equals(filtro)){
								Setiqueta=(String)allEtiqueta.get(i);	
								
							}
							if(Sid==1){
								Pago="No detectable";
							}else{
								Pago="Detectable";
							}
							
							//Fin etiqueta de las confesiones//
							
							if(i<10){
								header="Confesion #00";
							}
							if(i>=10 && i<100){
								header="Confesion #0";
							}
							if(i>=100 && i<999){
								header="Confesion #";
							}
							NombreValor++;
							out.println("<section>"+"<div class='confes-header'><h2><p class='classObtenerConfes'>"+header+""+g4.getNumAllUse().get(i)+"</p>     <label class='etiquetaName'>Anonimo</label>     <p id='A"+i+"' style='display:none;'>"+allIdUsuarios.get(i)+"</p><p id='B"+i+"' style='display:none;'>"+pagoRepetido.get(i)+"</p><label class='etiquetaName'>"+Setiqueta+"</label>     <label class='etiquetaName'>"+Pago+"</label>     <label class='etiquetaName'>"+Sfecha+"</label></h2><hr></div>"+"<p>"+Sauxiliar+"</p>"+ "<div class='confes-footer'><span class='p'>  Precio: </span> <span class='Fpagoprecio'>S/ "+Fpago+"</span><button id='"+i+"' class='open-popup' >Pagar</button></div>"+"</section>");
						}
						
					}
				}catch(Exception e){
					out.println("<h1>"+"Error al mostrar los comentarios"+"</h1>");
				}
				
			%>
			
		 <div class="overlay" id="overlayId">
        
            <div class="popup" id="popupId">
                <a href="#" class="cerrar-popup"  id="btnCerrar" onclick="cerrarVentana();" ><img style="max-width: 16px; max-height: 16px; padding: 5px;"  class="classIcon" src="img/closeIcon.png" ></a>
                <h2 id="infoH2" align="center">Detalles</h2>
                <form class="formClass"action="indexOff.jsp" method="post" name="formPago2">
                    <table class="tableClass1">
                        <tr>
                            <td class="vaca">Monto a pagar</td>
                            <td><input type="text" value="S/15.00" name="inputValor2" disabled><input type="hidden" id="idCosto" name="nameCostoId" ></td>
                            
                        </tr>
                        <tr>
                            <td>La confesion a revelar es :<input type="hidden" name="nameUsuarioPagar" id="idUsuarioPagar"></td>
                            <td><input id="numConfesionId" type="text" value="Confesion 1" name="inputPago2"  disabled></td>
							<input name="numConfesionOculto" type="hidden">
                        </tr>
                        <tr>
                            <td colspan=2 align="center">�Esta seguro que desea continuar?</td>
                        </tr>
                        <tr>
                            <td colspan=2 align="center"><input type="checkbox" >Si</td>
                        </tr>
                        
                        <tr>
                            <td colspan=2 align="center"><input type="submit" value="Pagar" name="form2Submit" disabled></td>
                        </tr>
                    </table>
                </form>  
            </div>
        </div>
			
				
			<!--Fin Cuadro de resultado-->
			
			
			
			<section id="confe1">
				<div class="confes-header">
					<h2>Confesión #0001</h2>
					<hr>
				</div>
				<p>Morbi rutrum, turpis at efficitur scelerisque, 
					nisl mauris auctor metus, et luctus magna eros in nisi. 
					Etiam vitae finibus magna. Integer molestie tortor et ligula vehicula rhoncus. 
					Donec felis magna, efficitur ac eros id, consectetur efficitur quam. 
					Praesent scelerisque urna vel euismod rhoncus. Nulla porttitor lobortis risus, 
					vitae dapibus velit. Nunc tristique nisi id porttitor finibus.
					Praesent scelerisque urna vel euismod rhoncus. Nulla porttitor lobortis risus, 
					vitae dapibus velit. Nunc tristique nisi id porttitor finibus.
			
					
					
				</p>
				<div class="confes-footer">
					<span class="p">Precio: </span> <span class="precio">S/ 2.00</span>
					<form action="">
						<input type="submit" value="Pagar" name="pagar">
					</form>
				</div>
			</section>
			
		</main>
		<br>
		<aside class="adicional">
			<form action="">
				<label for="buscar">Buscar: </label>
				<input type="text" id="buscar" name="buscar" placeholder="Buscar..">
			</form>
			<figure>
				<figcaption>Anuncios: </figcaption>
				<img src="img/publi.jpg" alt="Anuncio">
				<img src="img/publi1.gif" alt="Anuncio">
			</figure>
		</aside>
	</div>

	<script src="js/popup.js"></script>
	
	<!--
	<footer>
		<span>Copyright© 2019 Confe$$ Todos los derechos reservados</span>
		<a href="">Contacto</a>
		<a href="">Nosotros</a>
		<a href="">Términos y condiciones</a>
	</footer>
	-->
</body>
</html>