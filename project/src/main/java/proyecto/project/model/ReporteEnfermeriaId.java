package proyecto.project.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class ReporteEnfermeriaId {

    private Long idAgenda;               
    private Long idHistoriaClinica;      
    private Long idPaciente;             
    private String nombrePaciente;       
    private String apellidoPaciente;     
    private Long idProfesional;          
    private String nombreProfesional;    
    private String apellidoProfesional;  
    private String servicio;             
    private String turno;    
    private Date fechaHistoria;                  
    private Integer frecuenciaCardiaca;  
    private String presionArterial;      
    private Integer temperatura;         
    private Integer saturacionOxigeno;   
    private Integer frecuenciaRespiratoria; 
    private Integer glucosa; 
    private String medicamentos;         
    private String notaEnfermeria;       
    private String actividad;            
            
}
