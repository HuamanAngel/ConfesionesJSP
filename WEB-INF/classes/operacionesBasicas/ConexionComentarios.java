package operacionesBasicas;

import java.io.PrintWriter;
import java.net.UnknownHostException;
import java.sql.*;
import java.util.*;

public class ConexionComentarios extends ClaseConexion{
	private String salida;
	private ArrayList<Integer> numConfesion;
	
	private ArrayList<String> salidaUnmsm;
	private ArrayList<String> salidaPucp;
	private ArrayList<String> salidaConfesiones;
	private ArrayList<Integer> salidaUsuarios;
	private ArrayList<String> salidaInstitucion;
	private int contadorUnmsm;
	private int contadorPucp;
	private int contadorUsuarios;
	private int contadorComentarios;
	private int contadorConfesion;
	public ConexionComentarios() {
		salida="no hay errores";
		numConfesion = new ArrayList<Integer>();
		salidaUnmsm= new ArrayList<String>();
		salidaPucp= new ArrayList<String>();
		salidaConfesiones = new ArrayList<String>();
		salidaUsuarios = new ArrayList<Integer>();
		salidaInstitucion=new ArrayList<String>();
		
		contadorUnmsm=0;
		contadorPucp=0;
	}
	public ArrayList<String> getSalidaInstitucion(){
		return salidaInstitucion;
	}
	
	public ArrayList<String> getSalidaUnmsm(){
		return salidaUnmsm;
	}
	public ArrayList<String> getSalidaPucp(){
		return salidaPucp;
	}
	public ArrayList<String> getSalidaConfesiones(){
		return salidaConfesiones;
	}
	public ArrayList<Integer> getSalidaUsuarios(){
		return salidaUsuarios;
	}
	public ArrayList<Integer> getNumConfesion(){
		return numConfesion;
	}
	//Setters//
	public void setSalidaUnmsm(String algo, String etiqueta,int idUsConf){
		salidaConfesiones.add(contadorUnmsm,algo);
		contadorUnmsm++;
	}
	public void setSalidaPucp(String algo, String etiqueta,int idUsConf){
		salidaConfesiones.add(contadorPucp,algo);
		contadorPucp++;
	}
	public void setSalidaConfesiones(String algo,String etiqueta,int idUsConf){
		salidaConfesiones.add(contadorConfesion,algo);
		contadorConfesion++;
	}
	//Fin Setters//
	
	public String getSalida() {
		return salida;
	}
	public int getContadorUnmsm() {
		return contadorUnmsm;
	}
	public int getContadorPucp() {
		return contadorPucp;
	}
	public void Conectar() {
		contadorUnmsm=0;
		contadorPucp=0;
		contadorUsuarios=0;
		contadorComentarios=0;
		contadorConfesion=0;
		
		ClaseConexion g1=new ClaseConexion();
		Connection miConexion=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			miConexion=DriverManager.getConnection(g1.getUrl(),g1.getUsuario(),g1.getContra());
			Statement miStatement=miConexion.createStatement();
			ResultSet miResultSet=miStatement.executeQuery("SELECT * FROM confesion");
			while(miResultSet.next()) {
				numConfesion.add(contadorComentarios,miResultSet.getInt("idConfesion"));
				salidaConfesiones.add(contadorConfesion,miResultSet.getString("confesion"));
				salidaUsuarios.add(contadorUsuarios,miResultSet.getInt("idUsConf"));
				
				salidaInstitucion.add(contadorConfesion,miResultSet.getString("etiqueta"));
				contadorConfesion++;
				contadorUsuarios++;
				contadorComentarios++;
				if("UNMSM".equals(miResultSet.getString("etiqueta")) || "unmsm".equals(miResultSet.getString("etiqueta")) ) {
					salidaUnmsm.add(contadorUnmsm,miResultSet.getString("confesion"));
					contadorUnmsm++;
				}
				if("PUCP".equals(miResultSet.getString("etiqueta")) || "PUCP".equals(miResultSet.getString("etiqueta")) ) {
					salidaPucp.add(contadorPucp,miResultSet.getString("confesion"));
					contadorPucp++;
				}
			}
			miConexion.close();
		} catch (Exception e) {
			salida="No se conecto a la base de datos de COMENTARIOS";
		}
	}

	/*Prueba
	public static void main(String[] arg) {
		ConexionComentarios g2=new ConexionComentarios();
		g2.Conectar();
		ArrayList<String> allConfesion=g2.getSalidaConfesiones();
		ArrayList<String> allUnmsm=g2.getSalidaUnmsm();
		ArrayList<String> allPucp=g2.getSalidaPucp();
		
		System.out.println("***********Todos los comentarios*************");
		for(String aux:allConfesion) {
			System.out.println(aux);
		}
		System.out.println("***********Confesiones UNMSM*************");
		for(String aux:allUnmsm) {
			System.out.println(aux);
		}
		System.out.println("***********Confesiones PUCP*************");
		for(String aux:allPucp) {
			System.out.println(aux);
		}
	}*/
	
}
