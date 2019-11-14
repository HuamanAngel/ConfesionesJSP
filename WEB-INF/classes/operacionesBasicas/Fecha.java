package operacionesBasicas;

import java.time.*;
import java.util.*;
public class Fecha {

	String fechaActual;
	public Fecha() {
		fechaActual="";
	}
	public String getFechaActual() {
		return fechaActual;
	}
	public void cargarFecha() {
		ZonedDateTime tiempo=ZonedDateTime.now(ZoneId.of("America/Lima"));
		String year=String.valueOf(tiempo.getYear());
		String mes=String.valueOf(tiempo.getMonthValue());
		String day=String.valueOf(tiempo.getDayOfMonth());
		String hora=String.valueOf(tiempo.getHour());
		String minuto=String.valueOf(tiempo.getMinute());
		String segundo=String.valueOf(tiempo.getSecond());

		this.fechaActual=year+"-"+mes+"-"+day+" "+hora+":"+minuto+":"+segundo;
		this.fechaActual=this.fechaActual.trim();

	}
}
