package proyecto.project.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;
import proyecto.project.model.UsuarioEmpleado;
import proyecto.project.repository.LoginERepository;

@Service
public class UsuarioEmpleadoService {
    
    @Autowired
    private LoginERepository empleadoRepository; 

    public boolean existeEmpleadoPorIdentificacion(Long identificacion) {
        return empleadoRepository.findByIdentificacionE(identificacion).isPresent();
    }

    public boolean existeEmpleadoPorEmail(String email) {
        return empleadoRepository.findByEmailE(email).isPresent();
    }

    public boolean existeEmpleadoPorTelefono(String telefono){
        return empleadoRepository.findByTelefonoE(telefono).isPresent();
    }

    public List<UsuarioEmpleado> obtenerEmpleados() {
        return empleadoRepository.findByIdRolE(2); 
    }

    public UsuarioEmpleado obtenerEmpleadoPorId(Long id) {
        Optional<UsuarioEmpleado> empleado = empleadoRepository.findById(id);
        return empleado.orElse(null);
    }

    public void guardarEmpleado(UsuarioEmpleado empleado) {
        empleadoRepository.save(empleado);
    }

    @Transactional
    public void guardarUsuarioYEmpleado(UsuarioEmpleado empleado) {
        empleadoRepository.save(empleado);
    
        empleadoRepository.insertEmpleado(empleado.getIdentificacionE());
    }
    

    @Transactional
    public void actualizarEmpleado(Long identificacionOriginal, Long nuevaIdentificacion, String nombre, String apellido,
                                   String telefono, String email, String direccion, String rh, String password) {
        int filasActualizadas = empleadoRepository.actualizarEmpleado(
            identificacionOriginal, nuevaIdentificacion, nombre, apellido, telefono, email, direccion, rh, password
        );

        if (filasActualizadas == 0) {
            throw new RuntimeException("Error: No se pudo actualizar el empleado. Empleado no encontrado.");
        }
    }

        // Método para actualizar el empleado
        public void actualizarEmpleado(UsuarioEmpleado empleado) {
            // Solo guarda el empleado actualizado, sin eliminar el registro
            empleadoRepository.save(empleado);
        }

    public List<UsuarioEmpleado> obtenerEmpleadosNoEliminados() {
        return empleadoRepository.findByIdRolEAndIsDeletedFalse(2);
    }

    public void eliminarEmpleado(Long id) {
        UsuarioEmpleado empleado = obtenerEmpleadoPorId(id);
        if (empleado != null) {
            empleado.setDeleted(true);
            empleadoRepository.save(empleado);
        }
    }

    public void borrarEmpleado(Long id) {
        empleadoRepository.deleteById(id);  
    }
    
}
    

