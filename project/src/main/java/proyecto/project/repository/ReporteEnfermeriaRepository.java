package proyecto.project.repository;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.StoredProcedureQuery;
import proyecto.project.model.ReporteEnfermeria;
import proyecto.project.model.ReporteEnfermeriaId;

@Repository
public class ReporteEnfermeriaRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @SuppressWarnings("unchecked")
    public List<ReporteEnfermeria> obtenerReporteEnfermeria() {
        // Llamada al procedimiento almacenado
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("ReporteEnfermeria");
        query.execute();

        List<Object[]> resultados = query.getResultList();

        List<ReporteEnfermeria> reportes = new ArrayList<>();
        for (Object[] fila : resultados) {
            ReporteEnfermeria reporte = new ReporteEnfermeria(
                    ((Number) fila[0]).longValue(), // ID Agenda
                    ((Number) fila[1]).longValue(), // ID Historia Clínica
                    ((Number) fila[2]).longValue(), // ID Paciente
                    (String) fila[3], // Nombre Paciente
                    (String) fila[4], // Apellido Paciente
                    (String) fila[12], // Nombre Profesional
                    (String) fila[13], // Apellido Profesional
                    (String) fila[14], // Servicio
                    (String) fila[15], // Turno
                    (Date) fila[25] // Fecha Historia
            );
            reportes.add(reporte);
        }

        return reportes;
    }

    public List<ReporteEnfermeriaId> obtenerReporteEnfermeriaPorId(Long idHistoriaClinica) {
        if (idHistoriaClinica == null) {
            throw new IllegalArgumentException("El parámetro idHistoriaClinica no puede ser null");
        }
    
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("ReporteEnfermeriaPorId")
            .registerStoredProcedureParameter(1, Long.class, jakarta.persistence.ParameterMode.IN)
            .setParameter(1, idHistoriaClinica);
    
        query.execute();
    
        @SuppressWarnings("unchecked")
        List<Object[]> resultadosId = query.getResultList();
    
        List<ReporteEnfermeriaId> reportesId = new ArrayList<>();
    
        // Procesar los resultados
        for (Object[] fila : resultadosId) {    
            // Construir el objeto ReporteEnfermeriaId
            ReporteEnfermeriaId reporte = new ReporteEnfermeriaId(
                ((Number) fila[0]).longValue(),  // ID Agenda
                ((Number) fila[1]).longValue(),  // ID Historia Clínica
                ((Number) fila[2]).longValue(),  // ID Paciente
                (String) fila[3],                // Nombre Paciente
                (String) fila[4],                // Apellido Paciente
                ((Number) fila[5]).longValue(),  // ID Profesional
                (String) fila[6],                // Nombre Profesional
                (String) fila[7],                // Apellido Profesional
                (String) fila[8],                // Servicio
                (String) fila[9],                // Turno
                ((Date) fila[10]),          // Fecha Historia (Timestamp)
                ((Number) fila[11]).intValue(),  // Frecuencia Cardiaca (BPM)
                (String) fila[12],               // Presión Arterial (mmHg)
                ((Number) fila[13]).intValue(),  // Temperatura (°C)
                ((Number) fila[14]).intValue(),  // Saturación Oxígeno (%)
                ((Number) fila[15]).intValue(),  // Frecuencia Respiratoria (RPM)
                ((Number) fila[16]).intValue(),  // Glucosa (mg/dL)
                (String) fila[17],               // Medicamento
                (String) fila[18],               // Nota Enfermería
                (String) fila[19]                // Actividad
            );
            reportesId.add(reporte);
        }
    
        return reportesId;
    }
    
    
}
