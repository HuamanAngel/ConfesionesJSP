<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="operacionesBasicas.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			ConexionComentarios g1=new ConexionComentarios();
			g1.Conectar();
			for(String aux : g1.getSalidaConfesiones()){
				out.println(aux);
			}
		%>
	</body>
</html>