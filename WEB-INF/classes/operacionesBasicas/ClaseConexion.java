package operacionesBasicas;

import java.sql.*;
import java.util.*;

public class ClaseConexion {
	private String usuario;
	private String contra;
	private String url;
	//Modificar en caso de tener una diferente conexion//
	public ClaseConexion() {
		usuario="admin";
		contra="admin";
		url="jdbc:mysql://localhost:3306/confesiones";
	}
	//////////////////////////////////////////////
	public ClaseConexion(String usuario,String contra,String url) {
		this.usuario=usuario;
		this.contra=contra;
		this.url=url;
	}
	public String getUsuario(){
		return this.usuario;
	}
	public String getContra(){
		return this.contra;
	}
	public String getUrl() {
		return this.url;
	}
}
