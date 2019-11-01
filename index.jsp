<%@page import="java.util.*"%>
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
				<a href="login/login.jsp">Login</a>
				<a href="login/registro.jsp">Registrarse</a>
			</div>
		</div>
	</header>

	<div class="cuerpo">
		<form class="filtro">
			<section class="instituciones-section">
				<label for="instituciones">Filtrar por institución: </label>
				<select id="instituciones" name="filtro-institucion">
					<option value="unmsm">UNMSM</option>
					<option value="uni">UNI</option>
					<option value="unac">UNAC</option>
					<option value="pucp">PUCP</option>
					<option value="upc">UPC</option>
					<option value="upn">UPN</option>
				</select>
			</section>

			<section class="ordenar-section">
				<label for="ordenar">Ordenar por: </label>
				<select id="ordenar" name="ordenar">
					<option value="antiguedad">Antiguedad</option>
					<option value="likes">Likes</option>
					<option value="mas-pagados">Más pagados</option>
				</select>
			</section>

			<section class="filtro-submit">
				<input type="submit" name="Aceptar" value="Filtrar">
			</section>
		</form>

		<main class="confesiones">
			
			<!--Proceso de session-->
			<%
				boolean Scomparador=false;
				List<String> listaElementos=(List<String>)session.getAttribute("misElementos");
				if(listaElementos==null){
					listaElementos=new ArrayList<String>();
					session.setAttribute("misElementos",listaElementos);
				}
				String elementos=request.getParameter("TAconfesion");
				if(elementos!=null && elementos!=" "){
					for(String auxiliar:listaElementos){
						if(elementos.equals(auxiliar)){
							Scomparador=true;
						}
					}
					if(Scomparador==false){
						
						listaElementos.add(elementos);
					}
				}
			%>
			<!--Proceso de session-->
			<!--Cuadro de texto mejorado-->
			<section id="confe3" class="Ctexto">
				<div class="confes-header">
					<h2>Confesión #0003</h2>
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
				if(listaElementos!=null){
					for(String elemTemp : listaElementos){
						out.println("<section>"+"<div class='confes-header'><h2>Confesión #0003</h2><hr></div>"+"<p>"+elemTemp+"</p>"+ "<div class='confes-footer'><span class='p'>Precio: </span> <span class='precio'>S/ 10.00</span><form action=''><input type='submit' value='Pagar' name='pagar'></form></div>"+"</section>");
					}
				}
			%>
			<!--Fin Cuadro de resultado-->
			
			
			
			
			<section id="confe1">
				<div class="confes-header">
					<h2>Confesión ñabga #0001</h2>
					<hr>
				</div>
				<p>Morbi rutrum, turpis at efficitur scelerisque, 
					nisl mauris auctor metus, et luctus magna eros in nisi. 
					Etiam vitae finibus magna. Integer molestie tortor et ligula vehicula rhoncus. 
					Donec felis magna, efficitur ac eros id, consectetur efficitur quam. 
					Praesent scelerisque urna vel euismod rhoncus. Nulla porttitor lobortis risus, 
					vitae dapibus velit. Nunc tristique nisi id porttitor finibus.
					Praesent scelerisque urna vel euismod rhoncus. Nulla porttitor lobortis risus, 
					vitae dapibus velit. Nunc tristique nisi id porttitor finibus.</p>
				<div class="confes-footer">
					<span class="p">Precio: </span> <span class="precio">S/ 2.00</span>
					<form action="">
						<input type="submit" value="Pagar" name="pagar">
					</form>
				</div>
			</section>
			<section id="confe2">
				<div class="confes-header">
					<h2>Confesión #0002</h2>
					<hr>
				</div>
				<p>Morbi rutrum, turpis at efficitur scelerisque, 
						nisl mauris auctor metus, et luctus magna eros in nisi. 
						Etiam vitae finibus magna. Integer molestie tortor et ligula vehicula rhoncus. 
						Donec felis magna, efficitur ac eros id, consectetur efficitur quam. 
						Praesent scelerisque urna vel euismod rhoncus. Nulla porttitor lobortis risus, 
						vitae dapibus velit. Nunc tristique nisi id porttitor finibus.
						Praesent scelerisque urna vel euismod rhoncus. Nulla porttitor lobortis risus, 
						vitae dapibus velit. Nunc tristique nisi id porttitor finibus.</p>
					<div class="confes-footer">
						<span class="p">Precio: </span> <span class="precio">S/ 5.00</span>
						<form action="">
							<input type="submit" value="Pagar" name="pagar">
						</form>
					</div>
			</section>
			<section id="confe3">
				<div class="confes-header">
					<h2>Confesión #0003</h2>
					<hr>
				</div>
				<p>Morbi rutrum, turpis at efficitur scelerisque, 
						nisl mauris auctor metus, et luctus magna eros in nisi. 
						Etiam vitae finibus magna. Integer molestie tortor et ligula vehicula rhoncus. 
						Donec felis magna, efficitur ac eros id, consectetur efficitur quam. 
						Praesent scelerisque urna vel euismod rhoncus. Nulla porttitor lobortis risus, 
						vitae dapibus velit. Nunc tristique nisi id porttitor finibus.
						Praesent scelerisque urna vel euismod rhoncus. Nulla porttitor lobortis risus, 
						vitae dapibus velit. Nunc tristique nisi id porttitor finibus.</p>
				<div class="confes-footer">
					<span class="p">Precio: </span> <span class="precio">S/ 10.00</span>
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