package proyecto.project.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proyecto.project.model.FormularioPaciente;
import proyecto.project.repository.FormularioPRepository;
import proyecto.project.repository.PerfilPacienteRepository;

@Service
public class UsuarioPacienteService {

    @Autowired
    private PerfilPacienteRepository perfilPacienteRepository;

    @Autowired
    private FormularioPRepository formularioPRepository;

    public List<Object[]> obtenerPacientes() {
        return perfilPacienteRepository.ejecutarMostrarPacientes();
    }

    public Object[] obtenerPacientePorId(Long identificacionPaciente) {
        return perfilPacienteRepository.ejecutarPacientePorId(identificacionPaciente);
    }

    public void save(FormularioPaciente paciente) {
        formularioPRepository.save(paciente);
    }

    public void editarPaciente(
            Long identificacionP, String tId, String nombreP, String apellidoP, String direccionP,
            String rhP, Long idEps, String sexo, int edad, Date fNac, String alergia, 
            String nivelAlimentacion, String nivelBano, String nivelAutonomia, byte[] antMed,
            String panal, String audifonos, String marcaPasos, String protesisDental,
            Long idAcudiente, Long idParentesco, String nombreA, String apellidoA, 
            String telefonoA, String correoA, String ciudadA, String direccionA) {

        perfilPacienteRepository.ejecutarEditarPaciente(
                identificacionP, tId, nombreP, apellidoP, direccionP, rhP, idEps, sexo, edad,
                fNac, alergia, nivelAlimentacion, nivelBano, nivelAutonomia, antMed,
                panal, audifonos, marcaPasos, protesisDental, idAcudiente, idParentesco,
                nombreA, apellidoA, telefonoA, correoA, ciudadA, direccionA);
    }

    public void eliminarPaciente(Long idPaciente) {
        perfilPacienteRepository.ejecutarEliminarPaciente(idPaciente);
    }

    public void borrarPacienteYAcudiente(Long identificacionPaciente, Long idAcudiente) {
        perfilPacienteRepository.ejecutarBorrarPacienteYAcudiente(identificacionPaciente, idAcudiente);
    }

}
