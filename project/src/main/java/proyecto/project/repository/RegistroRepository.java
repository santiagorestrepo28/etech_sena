package proyecto.project.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Repository
public class RegistroRepository {
    @PersistenceContext
    private EntityManager entityManager;

    @SuppressWarnings("unchecked")
    public List<Object[]> findIngresoHoy() {
        jakarta.persistence.Query query = entityManager.createNativeQuery(
            "SELECT CONCAT(p.NOMBRE_P, ' ', p.APELLIDO_P) AS NombreDelPaciente, " +
            "CONCAT(a.NOMBRE_A, ' ', a.APELLIDO_A) AS NombreDelAcudiente, " +
            "p.DIRECCION_P AS Ubicacion, " +
            "a.TELEFONO_A AS TelefonoAcudiente, " +
            "a.CORREO_A AS CorreoAcudiente, " +
            "COUNT(p.IDENTIFICACION_P) OVER () AS ConteoPacientes " +
            "FROM dts_paciente p " +
            "JOIN acudiente a ON (p.IDENTIFICACION_P = a.IDENTIFICACION_P) " +
            "WHERE p.FECHA_INGRESO >= CURDATE()"
        );
        return query.getResultList();
    }
}
