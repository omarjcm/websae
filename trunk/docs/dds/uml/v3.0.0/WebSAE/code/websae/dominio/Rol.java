/**
 * @(#) Rol.java
 */

package websae.dominio;

public class Rol{
	private Integer id_rol;
	
	private String nombre;
	
	private String descripcion;
	
	/**
	 * indicador de estado
	 */
	private int estado;
	
	public Rol( ){
		
	}
	
	public void cr_Rol( ){
		
	}
	
	public void fin_Rol( ){
		
	}
	
	/**
	 * Referencia al tipo de objeto dependiente Rol_Usuario.
	 */
	public java.util.List<Rol_Usuario> ref_rol_usuario;
	
	
}
