package operacionesBasicas;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class EntradaConexion {

	public EntradaConexion(){
		
	}
	public void entradaPago(float dineroTotal,int idUsuarioPaga) {
		ClaseConexion g1=new ClaseConexion();
		Connection miConexion=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			miConexion=DriverManager.getConnection(g1.getUrl(),g1.getUsuario(),g1.getContra());
			Statement miStatement=miConexion.createStatement();
			ResultSet miResultSet=miStatement.executeQuery("SELECT * FROM usuario");
			while(miResultSet.next()) {
				if(idUsuarioPaga==miResultSet.getInt("idUsuario")){
					miStatement.executeUpdate("UPDATE usuario SET dineroTotal="+dineroTotal+" WHERE idUsuario="+idUsuarioPaga+"");
					break;
				}
			}
			miConexion.close();
		}catch(Exception e) {
			//System.out.println("No se pudo conectar a la DB usuarios");
		}
	}
	public void entradaDinero(float dineroTotal,int idUsuarioRecibe) {
		ClaseConexion g1=new ClaseConexion();
		Connection miConexion=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			miConexion=DriverManager.getConnection(g1.getUrl(),g1.getUsuario(),g1.getContra());
			Statement miStatement=miConexion.createStatement();
			ResultSet miResultSet=miStatement.executeQuery("SELECT * FROM usuario");
			while(miResultSet.next()) {
				if(idUsuarioRecibe==miResultSet.getInt("idUsuario")){
					dineroTotal=dineroTotal+miResultSet.getFloat("dineroTotal");
					miStatement.executeUpdate("UPDATE usuario SET dineroTotal="+dineroTotal+" WHERE idUsuario="+idUsuarioRecibe+"");
					break;
				}
			}
			miConexion.close();
		}catch(Exception e) {
			//System.out.println("El usuario no recibio");
		}
	}

}
