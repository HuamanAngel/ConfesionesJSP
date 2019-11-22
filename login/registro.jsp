<%@page import="operacionesBasicas.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Confe$$</title>
    <link rel="stylesheet" href="../css/estiloRegistro.css">
</head>

<body>
    <div class="contenedor">
        <img class="avatar" src="../img/ConfesSinFondo.png">
        <form action="registro.jsp">
            <label for="nombre">Nombres</label>
            <input type="text" name="nombreReal" id="nombre">
            <br/>
            
            <label for="nombre">Apellidos</label>
            <input type="text" name="apellidoReal" id="nombre">
            <br/>
            
            <label for="u" class="textLabel">Femenino   </label>
            <label for="u" class="textLabel1">Masculino</label>
			<input type="radio" class="entradaRadio1" name="sexo" value="M">
			<input type="radio" class="entradaRadio2" name="sexo" value="F">
			
            <label for="u">Universidad / Instituto  </label>
            <select name="Institucion" id="u">
                <option value="Seleccionar">Seleccionar</option>
                <option value="UNMSM">UNMSM</option>
                <option value="PUCP">PUCP</option>
                <option value="UNI">UNI</option>
                <option value="UNALM">UNALM</option>
                <option value="UPC">UPC</option>
                <option value="UPN">UPN</option>
                <option value="UNFV">UNFV</option>
                <option value="UNAC">UNAC</option>
            
            </select>
            <br/>
            <br />
            <label for="usuario">Nombre de Usuario</label>
            <input type="text" name="Usuario" id="usuario">
            <br>
            <label for="contraseÃ±a">Password</label>
            <input type="password" name="Contra" id="contraseÃ±a">
            <br>
            <label for="confirmacion">Confirmacion de Password</label>
            <input type="password" name="" id="confirmacion">
            <br>
            <label for="telefono">Numero de Telefono</label>
            <input type="text" name="Telefono" id="telefono">
            <br>
            <br>
            <label for="pago">Modalidad de Pago  </label>
            <select name="Modalidad" id="p">
                <option value="Ninguno">Seleccionar</option>
                <option value="VISA">VISA</option>
                <option value="PAYPAL">PAYPAL</option>
            </select>
            <br>
            <br>
            <input type="checkbox" name="" id="">Acepto los terminos y condiciones
            <br/>
            <br>
            <input type="submit" value="Registrar">
                    
        </form>
       
		<h1>
		<%	
			ClaseConexion g1=new ClaseConexion();
            String DBusuario = g1.getUsuario();
            String DBcontra = g1.getContra();
			Class.forName("com.mysql.jdbc.Driver");
			Connection miConexion=null;
            
			
			miConexion=DriverManager.getConnection(g1.getUrl(),DBusuario,DBcontra);
            Statement miStatement=miConexion.createStatement();
    		ResultSet miResultSet=miStatement.executeQuery("SELECT * FROM usuario");
    				
            
			
			int contadorUsuarios=0;
			
			String Rname = request.getParameter("nombreReal");
			String Rapellido = request.getParameter("apellidoReal");
			
			String Ssexo = request.getParameter("sexo");
			String Sinstitucion=request.getParameter("Institucion");
			String Susuario = request.getParameter("Usuario");
			String Scontra= request.getParameter("Contra");
			
			int Itelefono=0;
			String Stelefono = request.getParameter("Telefono");
			String Smodalidad= request.getParameter("Modalidad");
			try{
				Itelefono=Integer.parseInt(Stelefono);
			}catch(Exception e){
				out.println("No se colocaron numeros");
			}
			
			//Nuevos campos//
			
			//Fin nuevos campos//
			
			boolean Busuario = false;
			boolean Bcontra= false;
			boolean Btelefono = false;
			
			if(Susuario !=null && Scontra!=null && Ssexo!=null &&Stelefono!=null && Sinstitucion!=null ){
				while(miResultSet.next()){
					contadorUsuarios=miResultSet.getInt("idUsuario");
					Busuario = miResultSet.getString("nombreUsuario").equals(Susuario);
					
					Bcontra = miResultSet.getString("contraseña").equals(Scontra);
					Btelefono = miResultSet.getString("numTelefono").equals(Stelefono);
					
				}	
			}else{
				out.println("Tiene que colocar todos los campos");
			}
			
			if(Susuario!=null && Busuario==false){
				if(Ssexo!=null){
					if(Scontra!=null && Bcontra==false){
						if(Stelefono!=null && Btelefono==false){
							if(Sinstitucion!=null ){
								contadorUsuarios++;
								miStatement.executeUpdate("INSERT INTO usuario VALUE("+contadorUsuarios+",'"+Rname+"','"+Rapellido+"','"+Sinstitucion+"','"+Ssexo+"','"+Susuario+"','"+Scontra+"',"+Itelefono+",'"+Smodalidad+"')");
								miConexion.close();
								response.sendRedirect("../index.jsp");
							}else{
								out.println("Selecione el pais");
							}
						}else{
							out.println("Correo no valido");
						}
					}else{
						out.println("Contraseña no valida");
					}
				}else{
					out.println("Debe especificar su genero");
				}
			}else{
				out.println("Usuario no valido");
			}
			
		%>
		</h1>
		  
    </div>

</body>

</html>