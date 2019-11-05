<%@page import="operacionesBasicas.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Confe$$</title>
	<link rel="stylesheet" type="text/css" href="../css/estiloLogin.css">
	<meta name="viewport" content="width=device-width, user-scalable=no ,initial-scale=1.0,maximun-scale=1.0,minimun-scale=1.0">
	
</head>
<body>
	<div class="login-box">
		<img class="avatar" src="../img/ConfesSinFondo.png">
		<form action="login.jsp" method="post">
			<br>
			<label for="usuario">Usuario</label>
			
			<input type="text" name="LoginUser" >
			
			<label for="contraseña">Contraseña</label>
			
			<input type="password" name="LoginContra" >
			
			<input type="submit" value="Iniciar Sesion">
			<a href="#">¿Has olvidado tu contraseña?</a>
			<br/>
			<a href="registro.jsp">¿Aún no te has registrado?Que esperas!!</a>
		</form>
	</div>	
	<!--Login de base de datos -->
	<% 	
		ClaseConexion g1=new ClaseConexion();
		String DBusuario = g1.getUsuario();
		String DBcontra = g1.getContra();
		
		String contras;
		String nombresUsers;
		String nameUser=request.getParameter("LoginUser");
		String contraUser=request.getParameter("LoginContra");	
	
		
		Connection miConexion=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			miConexion=DriverManager.getConnection(g1.getUrl(),DBusuario,DBcontra);
			Statement miStatement=miConexion.createStatement();
			ResultSet miResultSet=miStatement.executeQuery("SELECT * FROM usuario");
			
			if(nameUser!=null && contraUser!=null){
				while(miResultSet.next()){
					nombresUsers=miResultSet.getString("nombreUsuario");
					contras=miResultSet.getString("contrase�a");
					
					if(nombresUsers.equals(nameUser) && contras.equals(contraUser)){
						
						//Atrapa los atributos del usuario
						
						List<String> listaDatos=(List<String>)session.getAttribute("DatosUser");
						if(listaDatos==null){
							listaDatos=new ArrayList<String>();
							session.setAttribute("DatosUser",listaDatos);
						}
						
						
						listaDatos.add(0,miResultSet.getString("idUsuario"));
						listaDatos.add(1,miResultSet.getString("nombre"));
						listaDatos.add(2,miResultSet.getString("apellidos"));
						listaDatos.add(3,miResultSet.getString("sexo"));
						listaDatos.add(4,miResultSet.getString("institucion"));
						listaDatos.add(5,miResultSet.getString("nombreUsuario"));
						listaDatos.add(6,miResultSet.getString("contrase�a"));
						listaDatos.add(7,miResultSet.getString("numTelefono"));
						listaDatos.add(8,miResultSet.getString("modalidadPago"));
						
						
						
						//Fin Atrapar datos
						//Cierra conexion
						if(miConexion!=null){
							try{
								miConexion.close();
							}catch(Exception error){		
								out.println("Error al cerrar la conexion");
							}
						}
						//Fin cierra conexion
						response.sendRedirect("../index.jsp");
					}
				}
				out.println("Usuario y/o contrase�a equivocado");
			}
			
		}catch(Exception e) {
			out.println("Imposible conectar VUELVA A INTENTAR");				
		}
		
		

	%>
	<!--Login de base de datos-->
		
</body>
</html>