package operacionesBasicas;

import java.io.PrintWriter;
import java.net.UnknownHostException;
import java.sql.*;
import java.util.*;

public class ConexionComentarios extends ClaseConexion{
	private String salida;
	private ArrayList<Integer> numConfesion;
	
	private ArrayList<String> salidaConfesiones;
	
	private ArrayList<String> salidaUnmsm;
	private ArrayList<String> salidaPucp;
	private ArrayList<String> salidaUni;
	private ArrayList<String> salidaUnalm;
	private ArrayList<String> salidaUpc;
	private ArrayList<String> salidaUpn;
	private ArrayList<String> salidaUnfv;
	private ArrayList<String> salidaUnac;	
	
	
	private ArrayList<Integer> salidaUsuarios;
	private ArrayList<Integer> salidaUsuariosUnmsm;
	private ArrayList<Integer> salidaUsuariosPucp;
	private ArrayList<Integer> salidaUsuariosUni;
	private ArrayList<Integer> salidaUsuariosUnalm;
	private ArrayList<Integer> salidaUsuariosUpc;
	private ArrayList<Integer> salidaUsuariosUpn;
	private ArrayList<Integer> salidaUsuariosUnfv;
	private ArrayList<Integer> salidaUsuariosUnac;

	
	private ArrayList<String> salidaInstitucion;
	private int contadorUnmsm;
	private int contadorPucp;
	private int contadorUsuarios;
	private int contadorComentarios;
	private int contadorConfesion;
	public ConexionComentarios() {
		salida="no hay errores";
		numConfesion = new ArrayList<Integer>();
		
		salidaConfesiones = new ArrayList<String>();

		
		salidaUnmsm= new ArrayList<String>();
		salidaPucp= new ArrayList<String>();
		salidaUni= new ArrayList<String> ();
		salidaUnalm = new ArrayList<String> ();
		salidaUpc = new ArrayList<String> ();
		salidaUpn = new ArrayList<String> ();
		salidaUnfv = new ArrayList<String> ();
		salidaUnac = new ArrayList<String> ();	

		salidaUsuarios = new ArrayList<Integer>();
		salidaUsuariosUnmsm=new ArrayList<Integer>();
		salidaUsuariosPucp=new ArrayList<Integer>();
		salidaUsuariosUni = new ArrayList<Integer> ();
		salidaUsuariosUnalm = new ArrayList<Integer> ();
		salidaUsuariosUpc = new ArrayList<Integer> ();
		salidaUsuariosUpn = new ArrayList<Integer> ();
		salidaUsuariosUnfv = new ArrayList<Integer> ();
		salidaUsuariosUnac = new ArrayList<Integer> ();

		
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
	public ArrayList<String> getSalidaUni(){
		return salidaUni;
	}
	public ArrayList<String> getSalidaUnalm(){
		return salidaUnalm;
	}

	public ArrayList<String> getSalidaUpc(){
		return salidaUpc;
	}
	public ArrayList<String> getSalidaUpn(){
		return salidaUpn;
	}

	public ArrayList<String> getSalidaUnfv(){
		return salidaUnfv;
	}
	public ArrayList<String> getSalidaUnac(){
		return salidaUnac;
	}

	public ArrayList<String> getSalidaConfesiones(){
		return salidaConfesiones;
	}
	
	
	
	public ArrayList<Integer> getSalidaUsuarios(){
		return salidaUsuarios;
	}
	public ArrayList<Integer> getSalidaUsuariosUnmsm(){
		return salidaUsuariosUnmsm;
	}
	public ArrayList<Integer> getSalidaUsuariosPucp(){
		return salidaUsuariosPucp;
	}
	public ArrayList<Integer> getSalidaUsuariosUni(){
		return salidaUsuariosUni;
	}
	public ArrayList<Integer> getSalidaUsuariosUnalm(){
		return salidaUsuariosUnalm;
	}
	public ArrayList<Integer> getSalidaUsuariosUpc(){
		return salidaUsuariosUpc;
	}
	public ArrayList<Integer> getSalidaUsuariosUpn(){
		return salidaUsuariosUpn;
	}
	public ArrayList<Integer> getSalidaUsuariosUnfv(){
		return salidaUsuariosUnfv;
	}
	public ArrayList<Integer> getSalidaUsuariosUnac(){
		return salidaUsuariosUnac;
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
		int c=0;
		int d=0;
		int e=0;
		int f=0;
		int g=0;
		int h=0;
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
					salidaUsuariosUnmsm.add(contadorUnmsm,miResultSet.getInt("idUsConf"));
					contadorUnmsm++;
				}
				if("PUCP".equals(miResultSet.getString("etiqueta")) || "PUCP".equals(miResultSet.getString("etiqueta")) ) {
					salidaPucp.add(contadorPucp,miResultSet.getString("confesion"));
					salidaUsuariosPucp.add(contadorPucp,miResultSet.getInt("idUsConf"));
					contadorPucp++;
				}
				if("UNI".equals(miResultSet.getString("etiqueta")) || "UNI".equals(miResultSet.getString("etiqueta")) ) {
					salidaUni.add(c,miResultSet.getString("confesion"));
					salidaUsuariosUni.add(c,miResultSet.getInt("idUsConf"));
					c++;
				}
				if("UNALM".equals(miResultSet.getString("etiqueta")) || "unalm".equals(miResultSet.getString("etiqueta")) ) {
					salidaUnalm.add(d,miResultSet.getString("confesion"));
					salidaUsuariosUnalm.add(d,miResultSet.getInt("idUsConf"));
					d++;
				}
				if("UPC".equals(miResultSet.getString("etiqueta")) || "upc".equals(miResultSet.getString("etiqueta")) ) {
					salidaUpc.add(e,miResultSet.getString("confesion"));
					salidaUsuariosUpc.add(e,miResultSet.getInt("idUsConf"));
					e++;
				}
				if("UPN".equals(miResultSet.getString("etiqueta")) || "upc".equals(miResultSet.getString("etiqueta")) ) {
					salidaUpn.add(f,miResultSet.getString("confesion"));
					salidaUsuariosUpn.add(f,miResultSet.getInt("idUsConf"));
					f++;
				}
				if("UNFV".equals(miResultSet.getString("etiqueta")) || "unfv".equals(miResultSet.getString("etiqueta")) ) {
					salidaUnfv.add(g,miResultSet.getString("confesion"));
					salidaUsuariosUnfv.add(g,miResultSet.getInt("idUsConf"));
					g++;
				}
				if("UNAC".equals(miResultSet.getString("etiqueta")) || "unac".equals(miResultSet.getString("etiqueta")) ) {
					salidaUnac.add(h,miResultSet.getString("confesion"));
					salidaUsuariosUnac.add(h,miResultSet.getInt("idUsConf"));
					h++;
				}
			
			}
			miConexion.close();
		} catch (Exception exceptionA) {
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
