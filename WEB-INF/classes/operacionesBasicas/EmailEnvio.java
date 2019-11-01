package operacionesBasicas;

import java.util.*;
public class Email{
	public boolean enviarEmail(String de,Strin clave, String para,String mensaje,String asunto){
		boolean enviado=false;
		try{
			String host="smtp.gmail.com";
			Properties prop=System.getProperties();
			prop.put("mail.smtp.strattls.enable","true");
			prop.put("mail.smtp.host",host);
			prop.put("mail.smtp.user",de);
			prop.put("mail.smtp.password",clave);
			prop.put("mail.smtp.port",587);
			prop.put("mail.smtp.auth","true");
			Session sesion=Session.getDefaultInstance(prop,null);
			
			MimeMessage mens=new MimeMessage(sesion);
		}catch(Exception e){
			
		}
		return enviado;
	}
}