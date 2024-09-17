package proyecto.project.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import jakarta.transaction.Transactional;
import proyecto.project.model.UsuarioEmpleado;

public interface LoginERepository extends JpaRepository<UsuarioEmpleado, Long> {
    @Query("SELECT u FROM UsuarioEmpleado u WHERE u.identificacionE = ?1 AND u.emailE = ?2 AND u.passwordE = ?3")
    UsuarioEmpleado findByIdentificacionAndEmailAndPassword(Long identificacionE, String emailE, String passwordE);

    @Modifying
    @Transactional
    @Query(value = "INSERT INTO empleado (IDENTIFICACION, ID_PROFESIONAL) VALUES (?1, ?1)", nativeQuery = true)
    void insertEmpleado(Long identificacion);    

    //*Agrega un nuevo método para buscar empleados por ID_ROL
    List<UsuarioEmpleado> findByIdRolE(Integer idRolE);
    
    //*Metodo para obtener empleados no eliminados
    List<UsuarioEmpleado> findByIdRolEAndIsDeletedFalse(Integer idRolE);

    //*Nuevos métodos para verificar duplicados
    Optional<UsuarioEmpleado> findByIdentificacionE(Long identificacionE);
    Optional<UsuarioEmpleado> findByEmailE(String emailE);
    Optional<UsuarioEmpleado> findByTelefonoE(String telefonoE);

    //*EditarEmpleado
    @Modifying
    @Transactional
    @Query("UPDATE UsuarioEmpleado e SET e.identificacionE = :nuevaIdentificacion, e.nombreE = :nombre, e.apellidoE = :apellido, " +
           "e.telefonoE = :telefono, e.emailE = :email, e.direccionE = :direccion, e.rhE = :rh, e.passwordE = :password " +
           "WHERE e.identificacionE = :identificacionOriginal")
    int actualizarEmpleado(
        @Param("identificacionOriginal") Long identificacionOriginal,
        @Param("nuevaIdentificacion") Long nuevaIdentificacion,
        @Param("nombre") String nombre,
        @Param("apellido") String apellido,
        @Param("telefono") String telefono,
        @Param("email") String email,
        @Param("direccion") String direccion,
        @Param("rh") String rh,
        @Param("password") String password
    );
}

