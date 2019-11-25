<%@page import="operacionesBasicas.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/estiloInfoUser.css">
        <meta http-equiv=”Content-Type” content=”text/html; charset=ISO-8859-1″ />
        <meta name="viewport" content="width=device-width, user-scalable=no ,initial-scale=1.0,maximun-scale=1.0,minimun-scale=1.0">
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

        <meta charset="UTF-8">
        <title>Usuario</title>
    </head>
    <body>
        <main class="contentPrincipal">
            <div class="topContent">
                <ul class="menuInformacion">
                    <li id="pantalla1">Informacion de usuario</li>
                    <li id="pantalla2">Confesiones propias</li>
                    <li id="pantalla3">Confesiones reveladas</li>
                </ul>
            </div>
			<%
				List<String> obtenerDatosUser=(List<String>)session.getAttribute("DatosUser");
				
			%>
            <div class="botContent" id="idBotContent1">
                    <form class="formInformacion">
                        <h2>Informacion de la persona</h2>
                        <label>Nombres : </label><input type="text" value="<%out.println(obtenerDatosUser.get(1));%>" disabled>
                        <br>
                        <br>
                        <label>Apellidos : </label><input type="text" value="<%out.println(obtenerDatosUser.get(2));%>" disabled>
                        <br>
                        <br>
                        <label>Telefono : </label><input type="text" value="<%out.println(obtenerDatosUser.get(7));%>" disabled>
                        <br>
                        <br>
                        <label>Sexo : </label><input type="text" value="<%if(obtenerDatosUser.get(4).equals("M")){out.println("Masculino");}else{out.println("Femenino");}%>" disabled>
                        <br>
                        <br>
                        <label>Universidad : </label><input type="text" value="<%out.println(obtenerDatosUser.get(4)); %>" disabled>
                        <hr color='gray' width='80%'>
    
                        <h2>Informacion de la cuenta</h2>
                        <label>Usuario :</label><input type="text" value="<%out.println(obtenerDatosUser.get(5));%>">
                        <br>
                        <br>
                        <label>Cambiar password: </label><input type="password" placeholder="Inserte nuevo password">
                        <br>
                        <br>
                        <label><input type="submit" value="Enviar"></label>
    
                    </form>
            </div>
                <div class="botContent2" id="idBotContent2">
                    <h2 class="parrafoDeConfesion">Confesion 2</h2>
                    <br>
                    <p class="parrafoDeConfesion">Mi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luego</p>
                    <br>
                    <label class="parrafoDeConfesion" style="border: 1px solid black;text-align: left; ">Precio : S/15.6</label><br><br>
                    <label class="opcionesConfesion">Eliminar confesion</label> <label class="opcionesConfesion">Cambiar precio</label>
                    <hr color='gray' width='80%'>
                    <hr color='gray' width='80%'>

                    <h2 class="parrafoDeConfesion">Confesion 15</h2>
                    <br>
                    <p class="parrafoDeConfesion">Mi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luego</p>
                    <br>
                    <label class="parrafoDeConfesion" style="border: 1px solid black; ">Precio : S/12.1</label><br><br>
                    <label class="opcionesConfesion">Eliminar confesion</label> <label class="opcionesConfesion">Cambiar precio</label>
                    <hr color='gray' width='80%'>
                    <hr color='gray' width='80%'>

                    <h2 class="parrafoDeConfesion">Confesion 17</h2>
                    <br>
                    <p class="parrafoDeConfesion">Mi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luego</p>
                    <label class="parrafoDeConfesion" style="border: 1px solid black; ">Precio : S/10.2</label><br><br>
                    <label class="opcionesConfesion">Eliminar confesion</label> <label class="opcionesConfesion">Cambiar precio</label>
                    <hr color='gray' width='80%'>
                    <hr color='gray' width='80%'>

                </div>

                <div class='botContent3' id='idBotContent3'>
                    <p class="parrafoNombre">Pedro</p>
                    <p class="parrafoApellido">Picapiedra</p>
                    <p class="parrafoTelefono">910231233</p>
                    <p class="parrafoSexo">Masculino</p>
                    <p class="parrafoUniversidad">Unmsm</p>
                    <p class="parrafoUsuario">MaquinaDeFuego</p>
                    <p class="parrafoCosto">S/8.2</p>

                    <h2 class='parrafoDeConfesion'>Confesion 2</h2>
                    <br>
                    <p class='parrafoDeConfesion'>Mi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luego</p>
                    <br>
                    <label class='opcionesConfesionConsulta' id='0' >Detalles</label>
                    <hr color='gray' width='80%'>
                    <hr color='gray' width='80%'>

                    
                    <p class="parrafoNombre">Juan</p>
                    <p class="parrafoApellido">Silfredo</p>
                    <p class="parrafoTelefono">923123521</p>
                    <p class="parrafoSexo">Masculino</p>
                    <p class="parrafoUniversidad">Unfv</p>
                    <p class="parrafoUsuario">Armadillo</p>
                    <p class="parrafoCosto">S/19.2</p>

                    <h2 class='parrafoDeConfesion'>Confesion 15</h2>
                    <br>
                    <p class="parrafoDeConfesion">Mi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luego</p>
                    <br>
                    <label class='opcionesConfesionConsulta' id='1' >Detalles</label>
                    <hr color='gray' width='80%'>
                    <hr color='gray' width='80%'>

                    
                    <p class="parrafoNombre">Maria</p>
                    <p class="parrafoApellido">Quiste</p>
                    <p class="parrafoTelefono">982012932</p>
                    <p class="parrafoSexo">Femenino</p>
                    <p class="parrafoUniversidad">Upc</p>
                    <p class="parrafoUsuario">Anonima</p>
                    <p class="parrafoCosto">S/12.2</p>

                    <h2 class="parrafoDeConfesion">Confesion 17</h2>
                    <br>
                    <p class="parrafoDeConfesion">Mi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luegoMi confesion es la siguiente yo estaba caminando por la casas y luego</p>
                    <label class='opcionesConfesionConsulta' id='2' >Detalles</label>
                    <hr color='gray' width='80%'>
                    <hr color='gray' width='80%'>
                </div>
                <div class="overlayDetalles" id="idOverlayDetalles">
                    <div class="popupDetalles" id="idPopupDetalles">
                        <form class="formInformacion" name="formDetalles">
                            <h2>Detalles de la cuenta</h2>
                            <label>Nombres : </label><input type="text" value="Perro" name="nameNombre" disabled>
                            <br>
                            <br>
                            <label>Apellidos : </label><input type="text" value="Apellidos" name="nameApellido" disabled>
                            <br>
                            <br>
                            <label>Telefono : </label><input type="text" value="921233123" name="nameTelefono" disabled>
                            <br>
                            <br>
                            <label>Sexo : </label><input type="text" value="Masculino" name="nameSexo" disabled>
                            <br>
                            <br>
                            <label>Universidad : </label><input type="text" value="UNMSM" name="nameUniversidad" disabled>
                            <br>
                            <br>
                            <label>Usuario : </label><input type="text" value="Oxipusio" name="nameUsuario" disabled>
                            <br>
                            <br>
                            <label>Costo : </label><input type="text" value="S/12.2" name="nameCosto" disabled>
                            <br>
                            <br>
                            <label class="labelAceptar">Salir/Aceptar</label>
                        </form>
                    </div>
                </div>
                
                
        </main>
        <script type="text/javascript" src="../js/eventosInfoUser.js"></script>
    </body>
</html>