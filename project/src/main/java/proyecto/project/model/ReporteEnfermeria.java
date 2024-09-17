package proyecto.project.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReporteEnfermeria {

    private Long idAgenda;
    private Long idHistoriaClinica;
    private Long idPaciente;
    private String nombrePaciente;
    private String apellidoPaciente;
    private String nombreProfesional;
    private String apellidoProfesional;
    private String servicio;
    private String turno;
    private Date fechaHistoria;

}
