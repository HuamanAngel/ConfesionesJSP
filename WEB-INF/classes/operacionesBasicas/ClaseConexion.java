package operacionesBasicas;

import java.sql.*;
import java.util.*;

public class ClaseConexion {
	private String usuario;
	private String contra;
	public ClaseConexion() {
		usuario="adminUsuario";
		contra="gatoConBotas";
	}
	public ClaseConexion(String usuario,String contra) {
		this.usuario=usuario;
		this.contra=contra;
	}
	public String getUsuario(){
		return this.usuario;
	}
	public String getContra(){
		return this.contra;
	}
}
