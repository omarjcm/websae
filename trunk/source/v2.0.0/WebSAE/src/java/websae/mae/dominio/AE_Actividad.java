//
//
//  Generated by StarUML(tm) Java Add-In
//
//  @ Project : WebSAE
//  @ File Name : AE_Actividad.java
//  @ Date : 23/04/2009
//  @ Author : Guillermo Pizarro
//
//

package websae.mae.dominio;

import java.math.BigDecimal;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import mad.eventos.Datos;
import mad.objetos.Registro;
import mad.objetos.Table;
import org.json.JSONArray;
import org.json.JSONObject;

public class AE_Actividad {
    
    // <editor-fold defaultstate="collapsed" desc="Objeto Maestro">
    public AE_Fecha_Evento ref_fecha_evento;
    // </editor-fold>
    
    // <editor-fold defaultstate="collapsed" desc="Atributos">
	private BigDecimal ac_id_actividad;
	private String ac_hora_inicio;
	private String ac_hora_fin;
	private String ac_actividad;
    // </editor-fold>
    
    public AE_Actividad() {
        this.ref_fecha_evento = new AE_Fecha_Evento();
    }
    
    // <editor-fold defaultstate="collapsed" desc="Setters & Getters">
    public String getAc_actividad() {
        return ac_actividad;
    }

    public void setAc_actividad(String ac_actividad) {
        this.ac_actividad = ac_actividad;
    }

    public String getAc_hora_fin() {
        return ac_hora_fin;
    }

    public void setAc_hora_fin(String ac_hora_fin) {
        this.ac_hora_fin = ac_hora_fin;
    }

    public String getAc_hora_inicio() {
        return ac_hora_inicio;
    }

    public void setAc_hora_inicio(String ac_hora_inicio) {
        this.ac_hora_inicio = ac_hora_inicio;
    }

    public BigDecimal getAc_id_actividad() {
        return ac_id_actividad;
    }

    public void setAc_id_actividad(BigDecimal ac_id_actividad) {
        this.ac_id_actividad = ac_id_actividad;
    }

    public AE_Fecha_Evento getRef_fecha_evento() {
        return ref_fecha_evento;
    }

    public void setRef_fecha_evento(AE_Fecha_Evento ref_fecha_evento) {
        this.ref_fecha_evento = ref_fecha_evento;
    }
    // </editor-fold>
    
    private void cr_AE_Actividad(Table objeto) {
        this.ac_id_actividad = new BigDecimal( (Long) objeto.get("ac_id_actividad") );
        this.ac_hora_inicio = (String) objeto.get("ac_hora_inicio");
        this.ac_hora_fin = (String) objeto.get("ac_hora_fin");
        this.ac_actividad = (String) objeto.get("ac_actividad");
        this.ref_fecha_evento.setFe_id_fecha_evento( new BigDecimal( (Long) objeto.get("ref_fecha_evento") ) );
    }
    
	public void fin_AE_Actividad() {
	}

    public static List< AE_Actividad > buscar_actividad(String id_fecha_evento) {
        List< AE_Actividad > actividades = new LinkedList< AE_Actividad >();
        
        Datos datos = new Datos("WebSAE"); //
        String sql = "SELECT * FROM ae_actividad WHERE ref_fecha_evento = "+id_fecha_evento+" ORDER BY ac_hora_inicio;";
        Registro registros = datos.consulta( sql );
        for (int i=0; i<registros.size(); i++) {
            Table objeto = (Table) registros.get(i);
            AE_Actividad actividad = new AE_Actividad();
            actividad.cr_AE_Actividad(objeto);
            actividades.add( actividad );
        }
        return actividades;
    }

    public static JSONObject toJSON(List< AE_Actividad > actividades) {
        JSONObject json = new JSONObject();
        try {
            JSONArray jsonItems = new JSONArray();
            for (Iterator<AE_Actividad> it = actividades.iterator(); it.hasNext();) {
                AE_Actividad actividad = it.next();
                jsonItems.put( toJSONObject( actividad ) );
            }
            json.put("identifier", "id_actividad");
            json.put("label", "actividad");
            json.put("items", jsonItems);
        } catch (Exception ex) {
            Logger.getLogger(AE_Actividad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return json;
    }
    
    public static JSONObject toJSONObject(AE_Actividad actividad) {
        JSONObject json = new JSONObject();
        try {
            json.put("id_actividad", actividad.getAc_id_actividad() );
            json.put("hora_inicio", actividad.getAc_hora_inicio() );
            json.put("hora_fin", actividad.getAc_hora_fin() );
            json.put("actividad", actividad.getAc_actividad() );
        } catch (Exception ex) {
            Logger.getLogger(AE_Actividad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return json;
    }
}
