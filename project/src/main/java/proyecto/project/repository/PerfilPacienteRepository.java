package proyecto.project.repository;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.StoredProcedureQuery;

@Repository
public class PerfilPacienteRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @SuppressWarnings("unchecked")
    public List<Object[]> ejecutarPerfilPaciente(int identificacionEmpleado) {
        StoredProcedureQuery storedProcedure = entityManager.createStoredProcedureQuery("PerfilPaciente")
                .registerStoredProcedureParameter(1, Integer.class, jakarta.persistence.ParameterMode.IN)
                .setParameter(1, identificacionEmpleado);

        storedProcedure.execute();
        return storedProcedure.getResultList();
    }

    @SuppressWarnings("unchecked")
    public List<Object[]> ejecutarMostrarPacientes() {
        StoredProcedureQuery storedProcedure = entityManager.createStoredProcedureQuery("MostrarPaciente");
        storedProcedure.execute();
        return storedProcedure.getResultList();
    }

    @SuppressWarnings("unchecked")
    public Object[] ejecutarPacientePorId(Long identificacionPaciente) {
        StoredProcedureQuery storedProcedure = entityManager.createStoredProcedureQuery("MostrarPacientePorId");
        storedProcedure.registerStoredProcedureParameter(1, Long.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.setParameter(1, identificacionPaciente);
        storedProcedure.execute();
        List<Object[]> resultado = storedProcedure.getResultList();

        return resultado.isEmpty() ? null : resultado.get(0);
    }

    public void ejecutarEditarPaciente(
            Long identificacionP, String tId, String nombreP, String apellidoP, String direccionP,
            String rhP, Long idEps, String sexo, int edad, Date fNac, String alergia, // Cambié idEps a Long
            String nivelAlimentacion, String nivelBano, String nivelAutonomia, byte[] antMed,
            String panal, String audifonos, String marcaPasos, String protesisDental,
            Long idAcudiente, Long idParentesco, String nombreA, String apellidoA, // Cambié idAcudiente y idParentesco
                                                                                   // a Long
            String telefonoA, String correoA, String ciudadA, String direccionA) {
        StoredProcedureQuery storedProcedure = entityManager.createStoredProcedureQuery("EditarPaciente");

        // Registrar los parámetros de entrada para el procedimiento almacenado
        storedProcedure.registerStoredProcedureParameter(1, Long.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.registerStoredProcedureParameter(2, String.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.registerStoredProcedureParameter(3, String.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.registerStoredProcedureParameter(4, String.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.registerStoredProcedureParameter(5, String.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.registerStoredProcedureParameter(6, String.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.registerStoredProcedureParameter(7, Long.class, jakarta.persistence.ParameterMode.IN); // Cambiado
                                                                                                               // a Long
        storedProcedure.registerStoredProcedureParameter(8, String.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.registerStoredProcedureParameter(9, Integer.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.registerStoredProcedureParameter(10, Date.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.registerStoredProcedureParameter(11, String.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.registerStoredProcedureParameter(12, String.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.registerStoredProcedureParameter(13, String.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.registerStoredProcedureParameter(14, String.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.registerStoredProcedureParameter(15, byte[].class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.registerStoredProcedureParameter(16, String.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.registerStoredProcedureParameter(17, String.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.registerStoredProcedureParameter(18, String.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.registerStoredProcedureParameter(19, String.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.registerStoredProcedureParameter(20, Long.class, jakarta.persistence.ParameterMode.IN); // Cambiado
                                                                                                                // a
                                                                                                                // Long
        storedProcedure.registerStoredProcedureParameter(21, Long.class, jakarta.persistence.ParameterMode.IN); // Cambiado
                                                                                                                // a
                                                                                                                // Long
        storedProcedure.registerStoredProcedureParameter(22, String.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.registerStoredProcedureParameter(23, String.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.registerStoredProcedureParameter(24, String.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.registerStoredProcedureParameter(25, String.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.registerStoredProcedureParameter(26, String.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.registerStoredProcedureParameter(27, String.class, jakarta.persistence.ParameterMode.IN);

        // Establecer los parámetros con los valores recibidos
        storedProcedure.setParameter(1, identificacionP);
        storedProcedure.setParameter(2, tId);
        storedProcedure.setParameter(3, nombreP);
        storedProcedure.setParameter(4, apellidoP);
        storedProcedure.setParameter(5, direccionP);
        storedProcedure.setParameter(6, rhP);
        storedProcedure.setParameter(7, idEps); // Cambiado a Long
        storedProcedure.setParameter(8, sexo);
        storedProcedure.setParameter(9, edad);
        storedProcedure.setParameter(10, fNac);
        storedProcedure.setParameter(11, alergia);
        storedProcedure.setParameter(12, nivelAlimentacion);
        storedProcedure.setParameter(13, nivelBano);
        storedProcedure.setParameter(14, nivelAutonomia);
        storedProcedure.setParameter(15, antMed);
        storedProcedure.setParameter(16, panal);
        storedProcedure.setParameter(17, audifonos);
        storedProcedure.setParameter(18, marcaPasos);
        storedProcedure.setParameter(19, protesisDental);
        storedProcedure.setParameter(20, idAcudiente); // Cambiado a Long
        storedProcedure.setParameter(21, idParentesco); // Cambiado a Long
        storedProcedure.setParameter(22, nombreA);
        storedProcedure.setParameter(23, apellidoA);
        storedProcedure.setParameter(24, telefonoA);
        storedProcedure.setParameter(25, correoA);
        storedProcedure.setParameter(26, ciudadA);
        storedProcedure.setParameter(27, direccionA);

        // Ejecutar el procedimiento almacenado
        storedProcedure.execute();
    }

    public void ejecutarEliminarPaciente(Long identificacionPaciente) {
        StoredProcedureQuery storedProcedure = entityManager.createStoredProcedureQuery("EliminarPaciente");
        storedProcedure.registerStoredProcedureParameter(1, Long.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.setParameter(1, identificacionPaciente);
        storedProcedure.execute();
    }

    public void ejecutarBorrarPacienteYAcudiente(Long identificacionOriginal, Long idAcudiente) { // Cambiado ambos a
                                                                                                  // Long
        StoredProcedureQuery storedProcedure = entityManager.createStoredProcedureQuery("BorrarPacienteYAcudiente");
        storedProcedure.registerStoredProcedureParameter(1, Long.class, jakarta.persistence.ParameterMode.IN);
        storedProcedure.registerStoredProcedureParameter(2, Long.class, jakarta.persistence.ParameterMode.IN);

        storedProcedure.setParameter(1, identificacionOriginal);
        storedProcedure.setParameter(2, idAcudiente);

        storedProcedure.execute();
    }

}
