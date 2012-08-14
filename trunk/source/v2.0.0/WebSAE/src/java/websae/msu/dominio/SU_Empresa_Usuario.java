//
//
//  Generated by StarUML(tm) Java Add-In
//
//  @ Project : WebSAE
//  @ File Name : SU_Empresa_Usuario.java
//  @ Date : 28/03/2009
//  @ Author : Guillermo Pizarro
//  @ Version : v1.0.0
//
//

package websae.msu.dominio;

import java.math.BigDecimal;
import websae.mac.dominio.AC_Usuario;

public class SU_Empresa_Usuario {

    // <editor-fold defaultstate="collapsed" desc="Objetos Maestros">
    public SU_Cargo ref_cargo;
    public AC_Usuario ref_usuario;
    public SU_Empresa ref_empresa;
    // </editor-fold>
    
    // <editor-fold defaultstate="collapsed" desc="Atributos">
    private BigDecimal eu_id_empresa_usuario;
    private String eu_telefono;
    private String eu_fax;
    private String eu_estado;
    // </editor-fold>

    public SU_Empresa_Usuario() {
        this.ref_cargo = new SU_Cargo();
        this.ref_usuario = new AC_Usuario();
        this.ref_empresa = new SU_Empresa();
    }

    // <editor-fold defaultstate="collapsed" desc="Setters & Getters">
    public String getEu_estado() {
        return eu_estado;
    }

    public void setEu_estado(String eu_estado) {
        this.eu_estado = eu_estado;
    }

    public String getEu_fax() {
        return eu_fax;
    }

    public void setEu_fax(String eu_fax) {
        this.eu_fax = eu_fax;
    }

    public BigDecimal getEu_id_empresa_usuario() {
        return eu_id_empresa_usuario;
    }

    public void setEu_id_empresa_usuario(BigDecimal eu_id_empresa_usuario) {
        this.eu_id_empresa_usuario = eu_id_empresa_usuario;
    }

    public String getEu_telefono() {
        return eu_telefono;
    }

    public void setEu_telefono(String eu_telefono) {
        this.eu_telefono = eu_telefono;
    }

    public SU_Cargo getRef_cargo() {
        return ref_cargo;
    }

    public void setRef_cargo(SU_Cargo ref_cargo) {
        this.ref_cargo = ref_cargo;
    }

    public SU_Empresa getRef_empresa() {
        return ref_empresa;
    }

    public void setRef_empresa(SU_Empresa ref_empresa) {
        this.ref_empresa = ref_empresa;
    }

    public AC_Usuario getRef_usuario() {
        return ref_usuario;
    }

    public void setRef_usuario(AC_Usuario ref_usuario) {
        this.ref_usuario = ref_usuario;
    }
    
    // </editor-fold>
    
	public void cr_SU_Empresa_Usuario() {
	}
	
	public void fin_SU_Empresa_Usuario() {
	
	}
}