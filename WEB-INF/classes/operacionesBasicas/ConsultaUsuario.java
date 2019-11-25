package operacionesBasicas;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

public class ConsultaUsuario {
	private int idUsuario;
	private ArrayList<String> textConfesion;
	private ArrayList<Float> costoConfesion;
	private ArrayList<Integer> numConfesion;
	private ArrayList<String> fechaConfesion;
	public ConsultaUsuario() {
		textConfesion=new ArrayList();
		costoConfesion=new ArrayList();
		numConfesion=new ArrayList();
		fechaConfesion=new ArrayList();
		idUsuario=-1;
	}
	public ArrayList<String> getTextConfesion(){
		return textConfesion;
	}
	public ArrayList<Float> getCostoConfesion(){
		return costoConfesion;
	}
	public ArrayList<Integer> getNumConfesion(){
		return numConfesion;
	}
	public ArrayList<String> getFechaConfesion(){
		return fechaConfesion;
	}
	public void confesionesDeUsuario(int idUsuario) {
		this.idUsuario=idUsuario;
	}
	
	public void conexionConsulta() {
		int valorUsuario=-2;
		int contadorConfes=0;
		ClaseConexion g1=new ClaseConexion();
		Connection miConexion=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			miConexion=DriverManager.getConnection(g1.getUrl(),g1.getUsuario(),g1.getContra());
			Statement miStatement=miConexion.createStatement();
			ResultSet miResultSet=miStatement.executeQuery("SELECT * FROM confesion");			
			while(miResultSet.next()) {
				valorUsuario=miResultSet.getInt("idUsConf");
				if(idUsuario==-1) {
					System.out.println("No se coloco usuario");
				}
				if(idUsuario==valorUsuario) {
					textConfesion.add(contadorConfes,miResultSet.getString("confesion"));
					costoConfesion.add(contadorConfes,miResultSet.getFloat("precio"));
					numConfesion.add(contadorConfes,miResultSet.getInt("idConfesion"));
					fechaConfesion.add(contadorConfes,miResultSet.getString("tiempo"));
					
					contadorConfes++;
				}
			}
		}catch(Exception e) {
			System.out.println("No se pudo conectar a la DB");
		}

		
	}
}
