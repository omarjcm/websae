/**
 * @(#) Pregunta.java
 */

package websae.dominio;

public class Pregunta{
	private Integer id_pregunta;
	
	private String titulo;
	
	/**
	 * indicador de estado
	 */
	private int estado;
	
	public Pregunta( ){
		
	}
	
	public void cr_Pregunta( ){
		
	}
	
	public void fin_Pregunta( ){
		
	}
	
	/**
	 * Referencia al tipo de objeto maestro Seccion.
	 */
	public Seccion ref_seccion;
	
	/**
	 * Referencia al tipo de objeto maestro Tipo_Pregunta.
	 */
	public Tipo_Pregunta ref_tipo_pregunta;
	
	/**
	 * Referencia al tipo de objeto dependiente Alternativa.
	 */
	public java.util.List<Alternativa> ref_alternativa;
	
	
}
