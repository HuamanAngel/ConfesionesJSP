package operacionesBasicas;

import java.time.*;
import java.util.*;
public class Fecha {

	public static void main(String[] arg) {
		/*
		Calendar fecha = Calendar.getInstance();
		System.out.println(fecha.get(Calendar.DATE)+"/"+fecha.get(Calendar.MONTH)+ "/"+ fecha.get(Calendar.YEAR));
		System.out.println("\n");
		System.out.println("ano : "+fecha.get(Calendar.DATE));
		System.out.println("mes : "+fecha.get(Calendar.MONTH));
		System.out.println("dia : "+fecha.get(Calendar.YEAR));
		System.out.println("Hora : "+fecha.get(Calendar.HOUR_OF_DAY));
		System.out.println("Minuto : "+fecha.get(Calendar.MINUTE));
		System.out.println("Segundo : "+fecha.get(Calendar.SECOND));
		System.out.println("Milisegundo : "+fecha.get(Calendar.MILLISECOND));
		System.out.println("\n");
		*/
		ZonedDateTime tiempo=ZonedDateTime.now(ZoneId.of("America/Lima"));
		
		System.out.println("Mes : "+tiempo.getYear());
		System.out.println("Mes : "+tiempo.getMonth());
		System.out.println("Mes : "+tiempo.getMonthValue());
		System.out.println("Mes : "+tiempo.getDayOfMonth());
		System.out.println("Hora : "+tiempo.getHour());
		System.out.println("Minuto : "+tiempo.getMinute());
		System.out.println("Second : "+tiempo.getSecond());
		System.out.println("Milisegundo : "+tiempo.getNano());
		
		
		
		
		
		
		
	}
}
