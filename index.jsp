<%@page import="operacionesBasicas.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>Confe$ione$</title>
	
	<meta http-equiv=”Content-Type” content=”text/html; charset=ISO-8859-1″ />
	<link rel="stylesheet" type="text/css" href="css/style.css">
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
					out.println("<a href='infoUser.jsp'>"+listaDatos.get(5)+"</a>");
					out.println("<a href='login/loginOff.jsp'>Cerra Sesion</a>");	
				}
			%>
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
			<!--Proceso de session-->
			
		
			<%
				try{
					
				
				int idUsuario=0;
				int contadorConfesion=0;
				String etiqueta="UNMSM";
				ConexionComentarios g2=new ConexionComentarios();
				g2.Conectar();
				List<String> infoUser=(List<String>)session.getAttribute("DatosUser");
				
				if(infoUser!=null){
					etiqueta = infoUser.get(4);
				}
				
				try{
					idUsuario=Integer.parseInt(infoUser.get(0));
				}catch(Exception e){
				}
		
				contadorConfesion = g2.getContadorPucp()+g2.getContadorUnmsm();
				
				ClaseConexion g1=new ClaseConexion();
	            String DBusuario = g1.getUsuario();
	            String DBcontra = g1.getContra();
				Class.forName("com.mysql.jdbc.Driver");
				Connection miConexion=null;
				miConexion=DriverManager.getConnection(g1.getUrl(),DBusuario,DBcontra);
	            Statement miStatement=miConexion.createStatement();
				
				boolean Scomparador=false;
				
				//IP
				String IP="0";
				try {
					IP=java.net.InetAddress.getLocalHost().getHostAddress();
				} catch (Exception e) {
					
				}
				//Fin IP
				
				String elementos=request.getParameter("TAconfesion");
				if(elementos!=null && elementos!=" "){
					for(String auxiliar:g2.getSalidaConfesiones()){
						if(elementos.equals(auxiliar)){
							Scomparador=true;
						}
					}
					if(Scomparador==false && elementos!=null){
			            contadorConfesion++; 
						if(infoUser!=null){
							miStatement.executeUpdate("INSERT INTO confesion VALUE("+contadorConfesion+",'"+elementos+"',"+idUsuario+",'"+etiqueta+"','"+IP+"')");	
						}else{
							idUsuario=1;
							miStatement.executeUpdate("INSERT INTO confesion VALUE("+contadorConfesion+",'"+elementos+"',"+idUsuario+",'"+etiqueta+"','"+IP+"')");	
						}
			            miConexion.close();
					}
				}
				}catch(Exception e){
					out.println("<label>"+"No se pudo conectar a la base de datos"+"</label>");
				}
			%>
			<!--Proceso de session-->
			<!--Cuadro de texto mejorado-->
			<section id="confe3" class="Ctexto">
				<div class="confes-header">
					<h2>Confesion   <% List<String> info=(List<String>)session.getAttribute("DatosUser");if(info==null){out.println("<label class='etiquetaName'>Anonimo</label>"+ "     <label class='etiquetaName'>UNMSM</label>     "+"<label class='etiquetaName'>No detectable</label>" );}else{out.println("<label class='etiquetaName'>"+info.get(5) + "</label>     <label class='etiquetaName'>" + info.get(4)+"</label>"+"     <label class='etiquetaName'>Detectable</label>");}%></h2>
					<hr>
				</div>
				<form action="index.jsp" method="post">
					<textarea name="TAconfesion" wrap="Hard" placeholder="Confiesate"></textarea>
					<div class="confes-footer">
						<!--<span class="p">Precio: </span> <span class="precio">S/ 10.00</span>-->
							<input type="submit" value="Confesar" name="pagar">
					</div>
				</form>
			</section>
			
			<!--Fin Cuadro de texto mejorado-->
			
			<!--Cuadro de resultado-->	
			
			<%		
				ArrayList<String> allConfesion;
				ArrayList<String> allEtiqueta;
				ArrayList<Integer> allIdUsuarios;
				
				String Pago=" ";
				
				
				ConexionComentarios g4=new ConexionComentarios();
				g4.Conectar();
				allConfesion=g4.getSalidaConfesiones();
				allEtiqueta=g4.getSalidaInstitucion();
				allIdUsuarios = g4.getSalidaUsuarios();
				
				String filtro = null;
				filtro=request.getParameter("filtro-institucion");
					
				try{
					int LSindice=allConfesion.size();
					String Setiqueta="No encontrado";
					if(filtro==null || "all".equals(filtro)){
						LSindice=g4.getSalidaConfesiones().size();
						allIdUsuarios = g4.getSalidaUsuarios();						
						allConfesion = g4.getSalidaConfesiones();
					}
					if("unmsm".equals(filtro)){
						Setiqueta="UNMSM";
						LSindice=g4.getSalidaUnmsm().size();
						allIdUsuarios = g4.getSalidaUsuariosUnmsm();
						allConfesion = g4.getSalidaUnmsm();
					}
					if("pucp".equals(filtro)){
						Setiqueta="PUCP";
						LSindice=g4.getSalidaPucp().size();
						allIdUsuarios = g4.getSalidaUsuariosPucp();
						allConfesion = g4.getSalidaPucp();
					}

					if("uni".equals(filtro)){
						Setiqueta="UNI";
						LSindice=g4.getSalidaUni().size();
						allIdUsuarios = g4.getSalidaUsuariosUni();
						allConfesion = g4.getSalidaUni();
					}
					if("unalm".equals(filtro)){
						Setiqueta="UNALM";
						LSindice=g4.getSalidaUnalm().size();
						allIdUsuarios = g4.getSalidaUsuariosUnalm();
						allConfesion = g4.getSalidaUnalm();
					}

					if("upc".equals(filtro)){
						Setiqueta="UPC";
						LSindice=g4.getSalidaUpc().size();
						allIdUsuarios = g4.getSalidaUsuariosUpc();
						allConfesion = g4.getSalidaUpc();
					}
					if("upn".equals(filtro)){
						Setiqueta="UPN";
						LSindice=g4.getSalidaUpn().size();
						allIdUsuarios = g4.getSalidaUsuariosUpn();
						allConfesion = g4.getSalidaUpn();

					}
					if("unfv".equals(filtro)){
						Setiqueta="UNFV";
						LSindice=g4.getSalidaUnfv().size();
						allIdUsuarios = g4.getSalidaUsuariosUnfv();
						allConfesion = g4.getSalidaUnfv();
					}	

					if("unac".equals(filtro)){
						Setiqueta="UNAC";
						LSindice=g4.getSalidaUnac().size();
						allIdUsuarios = g4.getSalidaUsuariosUnac();
						allConfesion = g4.getSalidaUnac();
					}
					
					String header=" ";
					String Sauxiliar=" ";
					int Sid=1;
					if(allConfesion!=null){
						for(int i=LSindice-1;i>-1;i--){
							Sauxiliar=(String)allConfesion.get(i);
							Sid=(int)allIdUsuarios.get(i);
							
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
							out.println("<section>"+"<div class='confes-header'><h2>"+header+""+i+"     <label class='etiquetaName'>Anonimo</label>     <label class='etiquetaName'>"+Setiqueta+"</label>     <label class='etiquetaName'>"+Pago+"</label>     <label class='etiquetaName'>"+"publicacion"+"</label></h2><hr></div>"+"<p>"+Sauxiliar+"</p>"+ "<div class='confes-footer'><span class='p'>  Precio: </span> <span class='precio'>S/ 10.00</span><form action=''><input type='submit' value='Pagar' name='pagar'></form></div>"+"</section>");
						}
						
					}
				}catch(Exception e){
					out.println("<h1>"+"Error al mostrar los comentarios"+"</h1>");
				}
				
			%>
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