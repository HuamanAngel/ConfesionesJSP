package operacionesBasicas;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

public class ConsultaUsuario {
	private String filtro;
	private int idUsuario;
	private ArrayList<String> textConfesion;
	private ArrayList<Float> costoConfesion;
	private ArrayList<Integer> numConfesion;
	private ArrayList<String> fechaConfesion;

	private ArrayList<String> compradoresConfesion;
	private ArrayList<Integer> idCompradoresConfesion;
	
	/*Datos de los usuarios revelados*/
	private ArrayList<String> nombreUser;
	private ArrayList<String> apellidoUser;
	private ArrayList<String> institucionUser;
	private ArrayList<String> sexoUser;
	private ArrayList<String> usuarioUser;
	private ArrayList<Integer> telefonoUser;
	private ArrayList<Float> costoConfesionRevelados;
	private ArrayList<Integer> numeroUser;
	/*Fin Datos de los usuarios revelados*/
	/*Evitar repetir pagar usuario*/
	private ArrayList<Integer> esRepetidoPago;
	private ArrayList<Integer> esRepetidoPagoAll;
	/*Fin Evitar repetir pagar usuario*/
	public ConsultaUsuario() {
		filtro="all";
		esRepetidoPagoAll=new ArrayList();
		esRepetidoPago=new ArrayList();
		textConfesion=new ArrayList();
		costoConfesion=new ArrayList();
		numConfesion=new ArrayList();
		fechaConfesion=new ArrayList();
		idUsuario=-1;
		compradoresConfesion=new ArrayList();
		idCompradoresConfesion=new ArrayList();
		/*Inicializacion de datos revelados*/
		nombreUser=new ArrayList<String>();
		apellidoUser=new ArrayList<String>();
		institucionUser=new ArrayList<String>();
		sexoUser=new ArrayList<String>();
		usuarioUser=new ArrayList<String>();
		telefonoUser=new ArrayList<Integer>();
		costoConfesionRevelados=new ArrayList<Float>();
		numeroUser=new ArrayList<Integer>(); 
		/*Fin Inicializacion de datos revelados*/
	}
	public ArrayList<Integer> geEsRepetidoPagoAll(){
		return esRepetidoPagoAll;
	}
	public ArrayList<Integer> getEsRepetidoPago(){
		return esRepetidoPago;
	}

	public ArrayList<Integer> getNumeroUser(){
		return numeroUser;
	}
	public ArrayList<Float> getCostoConfesionRevelados(){
		return costoConfesionRevelados;
	}
	public ArrayList<String> getCompradoresConfesion(){
		return compradoresConfesion;
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
	
	public ArrayList<String> getNombreUser(){
		return nombreUser;
	}
	public ArrayList<String> getApellidoUser(){
		return apellidoUser;
	}
	public ArrayList<String> getInstitucionUser(){
		return institucionUser;
	}
	public ArrayList<String> getSexoUser(){
		return sexoUser;
	}
	public ArrayList<String> getUsuarioUser(){
		return usuarioUser;
	}
	public ArrayList<Integer> getTelefonoUser(){
		return telefonoUser;
	}

	public void confesionesDeUsuario(int idUsuario) {
		this.idUsuario=idUsuario;
	}
	
	public void conexionUsuarios(ArrayList<Integer> usuariosId) {
		ClaseConexion g1=new ClaseConexion();
		Connection miConexion=null;
		ArrayList<Integer> ordenadoId = new ArrayList();
		if(usuariosId!=null) {
			for(int i=0;i<usuariosId.size();i++) {
				ordenadoId.add(i,usuariosId.get(i));
			}
			Collections.sort(ordenadoId);

		}

		ArrayList<String> A=new ArrayList();
		ArrayList<String> B=new ArrayList();
		ArrayList<String> C=new ArrayList();
		ArrayList<String> D=new ArrayList();
		ArrayList<String> E=new ArrayList();
		ArrayList<Integer> F=new ArrayList();
		
		int pro=0;
		if(usuariosId!=null) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				miConexion=DriverManager.getConnection(g1.getUrl(),g1.getUsuario(),g1.getContra());
				Statement miStatement=miConexion.createStatement();
				ResultSet miResultSet=miStatement.executeQuery("SELECT * FROM usuario");	
				while(miResultSet.next()) {
					for(int j=0;j<usuariosId.size();j++) {
						if(miResultSet.getInt("idUsuario")==ordenadoId.get(j)) {
							A.add(pro,miResultSet.getString("nombre"));
							B.add(pro,miResultSet.getString("apellidos"));
							C.add(pro,miResultSet.getString("institucion"));
							D.add(pro,miResultSet.getString("sexo"));
							E.add(pro,miResultSet.getString("nombreUsuario"));
							F.add(pro,miResultSet.getInt("numTelefono"));
							pro++;
						}					
					}					
				}

				miConexion.close();
				
				for(int i=0;i<usuariosId.size();i++) {
					if(usuariosId.get(i)==ordenadoId.get(i)) {
						nombreUser.add(i,A.get(i));
						apellidoUser.add(i,B.get(i));
						institucionUser.add(i,C.get(i));
						sexoUser.add(i,D.get(i));
						usuarioUser.add(i,E.get(i));
						telefonoUser.add(i,F.get(i));
						
						ordenadoId.set(i,-1);


					}else{
						for(int m=0;m<usuariosId.size();m++) {
							if(usuariosId.get(i)==ordenadoId.get(m)) {
								nombreUser.add(i,A.get(m));
								apellidoUser.add(i,B.get(m));
								institucionUser.add(i,C.get(m));
								sexoUser.add(i,D.get(m));
								usuarioUser.add(i,E.get(m));
								telefonoUser.add(i,F.get(m));

								ordenadoId.set(m,-1);
								break;

							}
						}
					}
				}
			}catch(Exception e) {
				System.out.println("Error no se pudieron cargar los datos de usuario");
			}			
		}
	}
	public void setFiltro(String filtro) {
		this.filtro=filtro;
	}
	
	public void conexionConsulta(){
		String textoCompradores;
		String aux[];
		int contadorRepetido=-1;
		int contadorRepetidoAll=0;
		int valorUsuario=-2;
		int contadorConfes=0;
		int contador2=0;
		boolean encontrado=false;
		ClaseConexion g1=new ClaseConexion();
		Connection miConexion=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			miConexion=DriverManager.getConnection(g1.getUrl(),g1.getUsuario(),g1.getContra());
			Statement miStatement=miConexion.createStatement();
			ResultSet miResultSet=miStatement.executeQuery("SELECT * FROM confesion");	
			while(miResultSet.next()) {
				if(filtro==null || filtro.equals(miResultSet.getString("etiqueta").toLowerCase())) {
					contadorRepetido++;
					esRepetidoPago.add(contadorRepetido, 0);//1 para repetidos
				}

				esRepetidoPagoAll.add(contadorRepetidoAll,0);
				textoCompradores=miResultSet.getString("idCompradores");
				valorUsuario=miResultSet.getInt("idUsConf");
				aux=textoCompradores.split("F");
				for(int i=1;i<aux.length;i++) {
					if(idUsuario==Integer.parseInt(aux[i])) {
						encontrado=true;
						esRepetidoPagoAll.set(contadorRepetidoAll, 1);
						if(filtro.equals(miResultSet.getString("etiqueta").toLowerCase())) {
							esRepetidoPago.set(contadorRepetido, 1);//1 para repetidos
						}
						break;
					}
				}

				contadorRepetidoAll++;
				if(idUsuario==-1) {
					//System.out.println("No se coloco usuario");
				}
				if(encontrado){
					compradoresConfesion.add(contador2,miResultSet.getString("confesion"));
					idCompradoresConfesion.add(contador2,miResultSet.getInt("idUsConf"));
					costoConfesionRevelados.add(contador2,miResultSet.getFloat("precio"));
					numeroUser.add(contador2,miResultSet.getInt("idConfesion"));
					contador2++;
					encontrado=false;
				}
				if(idUsuario==valorUsuario) {
					textConfesion.add(contadorConfes,miResultSet.getString("confesion"));
					costoConfesion.add(contadorConfes,miResultSet.getFloat("precio"));
					numConfesion.add(contadorConfes,miResultSet.getInt("idConfesion"));
					fechaConfesion.add(contadorConfes,miResultSet.getString("tiempo"));	
					contadorConfes++;
				}
				
			}
			miConexion.close();
			conexionUsuarios(idCompradoresConfesion);
		}catch(Exception e) {
			System.out.println("No se pudo conectar a la DB");
		}
		
		
	}
}
