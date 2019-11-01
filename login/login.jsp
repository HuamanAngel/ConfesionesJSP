<%@page import="java.sql.*"%>

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
			<input type="text" >
			<label for="contraseña">Contraseña</label>
			<input type="password" >
			<input type="submit" value="Iniciar Sesión">
			<a href="#">¿Has olvidado tu contraseña?</a>
			<br/>
			<a href="registro.jsp">¿Aún no te has registrado?Que esperas!!</a>
		</form>
		<p align="center"><%out.println(errorConection);%></p>
	</div>	
	<!--Login de base de datos -->
	<%! String errorConection=" ";%>
	<%	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection miConexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/pruebas","root","");
			errorConection="  ";
		}catch(Exception e) {
			errorConection="Imposible Conectar";
		}

	%>
	<!--Login de base de datos-->
		
</body>
</html>