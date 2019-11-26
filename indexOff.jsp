<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="operacionesBasicas.*"%>
<%@page import="operacionesBasicas.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<%@page import="java.text.DecimalFormat" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Process</title>
</head>
<body>
				<%
					String gato=request.getParameter("precio1");
					DecimalFormat formato1 = new DecimalFormat("#.00");
					float precio=(float)0.0;
					if(gato!=null){
						precio=Float.parseFloat(gato);
						precio=precio*110/100;
						gato=formato1.format(precio);
						gato=gato.replace(",", ".");
						precio=(float)Float.parseFloat(gato);
					}
					int idUsuario=0;
					int contadorConfesion=0;
					String etiqueta="UNMSM";
					ConexionComentarios g2=new ConexionComentarios();
					//Carga la fecha//
					Fecha localFecha= new Fecha();
					localFecha.cargarFecha();
					
					//Fin carga la fecha//
					g2.Conectar();
					List<String> infoUser=(List<String>)session.getAttribute("DatosUser");
					
					if(infoUser!=null){
						etiqueta = infoUser.get(4);
					}
					
					try{
						idUsuario=Integer.parseInt(infoUser.get(0));
					}catch(Exception e){
					}
			
					contadorConfesion = g2.getSalidaConfesiones().size();
					
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
							contadorConfesion=contadorConfesion+1; 
			
							if(infoUser!=null){
								miStatement.executeUpdate("INSERT INTO confesion VALUE("+contadorConfesion+",'"+elementos+"',"+idUsuario+",'"+etiqueta+"','"+IP+"','"+localFecha.getFechaActual()+"',"+precio+",'"+"F"+"')");	
				
							}else{
								//idUsuario=1;
								//miStatement.executeUpdate("INSERT INTO confesion VALUE("+contadorConfesion+",'"+elementos+"',"+idUsuario+",'"+etiqueta+"','"+IP+"','"+localFecha.getFechaActual()+"',"+precio+")");	
							}
							miConexion.close();
						}
					}
				%>
	
				<%
					
				try{

					List<String> listaDatos=(List<String>)session.getAttribute("DatosUser");
		           	boolean estaDentro=false;
                	int valorConfesion=-1;
                	String convertir="";

					String costoConfesion=request.getParameter("nameCostoId");
					float costoTotal=0;

					if(costoConfesion!=null){
						float costoTotal2=0;
						String costoConfesion2;
						String aux2;
						DecimalFormat formato2 = new DecimalFormat("#.00");
						EntradaConexion entradaPago=new EntradaConexion();
						String auxVal;
						
						
						costoConfesion=costoConfesion.replace("S", "");
						costoConfesion=costoConfesion.replace("/", "");
						
						/*Inicio de Pago al usuario*/						
						costoConfesion2=costoConfesion;
						costoTotal2=Float.parseFloat(costoConfesion2);
						aux2=formato2.format(costoTotal2);
						aux2=aux2.replace(",", ".");
						costoTotal2=Float.parseFloat(aux2);
						/*Fin Inicio de Pago al usuario*/
						
						costoTotal=Float.parseFloat(costoConfesion);
						costoTotal=Float.parseFloat(listaDatos.get(9))-costoTotal;
						auxVal=formato2.format(costoTotal);
						auxVal=auxVal.replace(",", ".");
						costoTotal=Float.parseFloat(auxVal);
						
						entradaPago.entradaPago(costoTotal, Integer.parseInt(listaDatos.get(0)));
						
						entradaPago.entradaDinero(costoTotal2,Integer.parseInt(request.getParameter("nameUsuarioPagar")));
						listaDatos.set(9, auxVal);
					}
		        	  
					if(request.getParameter("numConfesionOculto")!=null){
	                	valorConfesion=Integer.parseInt(request.getParameter("numConfesionOculto"));						
					}
                	if(valorConfesion!=-1 ){
                		valorConfesion=valorConfesion-1;
                		
            			ClaseConexion g5=new ClaseConexion();
            			Class.forName("com.mysql.jdbc.Driver");
            			Connection miConexion2=null;
            			valorConfesion++;
            			miConexion2=DriverManager.getConnection(g5.getUrl(),g5.getUsuario(),g5.getContra());
                        Statement miStatement2=miConexion2.createStatement();
                		ResultSet miResultSet2=miStatement2.executeQuery("SELECT * FROM confesion");
						
                		while(miResultSet2.next()){
                			if(valorConfesion==miResultSet2.getInt("idConfesion")){
                				String aux=miResultSet2.getString("idCompradores");
                        		convertir=String.valueOf(listaDatos.get(0));
                        		convertir="F"+convertir;

                				convertir=convertir+aux;

                				estaDentro=true;
                			}
                		}
                		if(estaDentro){
    						miStatement2.executeUpdate("UPDATE confesion SET idCompradores='"+convertir+"' WHERE idConfesion="+valorConfesion+"");                			
                		}
	               		miConexion2.close();
                	}
		           }catch(Exception e){
		           }
				response.sendRedirect("index.jsp");

				%>
	

</body>
</html>