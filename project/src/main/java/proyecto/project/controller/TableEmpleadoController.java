package proyecto.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import proyecto.project.model.UsuarioEmpleado;
import proyecto.project.service.UsuarioEmpleadoService;

@Controller
public class TableEmpleadoController {

    @Autowired
    private UsuarioEmpleadoService empleadoService;

    @GetMapping("/TablaEmpleado")
    public String mostrarTablaEmpleado(HttpSession session, Model model) {
        String nombreAdmin = (String) session.getAttribute("nombreAdmin");
        if (nombreAdmin != null) {
            model.addAttribute("nombreAdmin", nombreAdmin);
            List<UsuarioEmpleado> empleados = empleadoService.obtenerEmpleadosNoEliminados();
            model.addAttribute("empleados", empleados);
        }
        return "tablaEmpleado";
    }

    @GetMapping("/EmpleadoInformacion")
    public String verEmpleado(HttpSession session, Model model) {
        Long id = (Long) session.getAttribute("empleadoId");
        if (id != null) {
            UsuarioEmpleado empleado = empleadoService.obtenerEmpleadoPorId(id);
            model.addAttribute("empleado", empleado);
            return "formularioEmpleadoInfo";
        } else {
            return "redirect:/logout";
        }
    }

    @GetMapping("/seleccionarEmpleado/{id}")
    public String seleccionarEmpleado(@PathVariable("id") Long id, HttpSession session) {
        session.setAttribute("empleadoId", id);
        return "redirect:/EmpleadoInformacion";
    }

    @GetMapping("/nuevoEmpleado")
    public String mostrarFormularioNuevoEmpleado(Model model) {
        model.addAttribute("empleado", new UsuarioEmpleado());
        return "formularioEmpleado";
    }

    @PostMapping("/crearEmpleado")
    public String crearEmpleado(
            @ModelAttribute UsuarioEmpleado empleado, 
            RedirectAttributes redirectAttributes) {
    
        if (empleadoService.existeEmpleadoPorIdentificacion(empleado.getIdentificacionE())) {
            redirectAttributes.addFlashAttribute("errorIdentificacion", true);
            return "redirect:/nuevoEmpleado";
        }
    
        empleadoService.guardarUsuarioYEmpleado(empleado);
    
        redirectAttributes.addFlashAttribute("empleadoAgregado", true);
        return "redirect:/TablaEmpleado";
    }
    
    

    @GetMapping("/editarEmpleadoSeleccionado/{id}")
    public String seleccionarEmpleadoParaEditar(@PathVariable("id") Long id, HttpSession session) {
        session.setAttribute("empleadoId", id);
        return "redirect:/editarEmpleado";
    }

    @GetMapping("/editarEmpleado")
    public String mostrarFormularioEditarEmpleado(HttpSession session, Model model) {
        Long id = (Long) session.getAttribute("empleadoId");

        if (id == null) {
            return "redirect:/TablaEmpleado";
        }

        UsuarioEmpleado empleado = empleadoService.obtenerEmpleadoPorId(id);
        if (empleado != null) {
            model.addAttribute("empleado", empleado);
            return "formularioEmpleadoEditar";
        } else {
            return "redirect:/TablaEmpleado";
        }
    }

    @PostMapping("/actualizarEmpleado")
    public String actualizarEmpleado(
            @RequestParam("identificacionOriginal") Long identificacionOriginal,
            @RequestParam("identificacionE") Long nuevaIdentificacion,
            @RequestParam("idRolE") Integer idRolE, 
            @RequestParam("nombreE") String nombreE,
            @RequestParam("apellidoE") String apellidoE,
            @RequestParam("TelefonoE") String telefonoE,
            @RequestParam("emailE") String emailE,
            @RequestParam("direccionE") String direccionE,
            @RequestParam("rhE") String rhE,
            @RequestParam("passwordE") String passwordE,
            RedirectAttributes redirectAttributes) {
        
        UsuarioEmpleado empleado = empleadoService.obtenerEmpleadoPorId(identificacionOriginal);
    
        if (empleado != null) {
            empleadoService.borrarEmpleado(identificacionOriginal);
    
            UsuarioEmpleado nuevoEmpleado = new UsuarioEmpleado();
            nuevoEmpleado.setIdentificacionE(nuevaIdentificacion); 
            nuevoEmpleado.setIdRolE(idRolE);  
            nuevoEmpleado.setNombreE(nombreE);
            nuevoEmpleado.setApellidoE(apellidoE);
            nuevoEmpleado.setTelefonoE(telefonoE);
            nuevoEmpleado.setEmailE(emailE);
            nuevoEmpleado.setDireccionE(direccionE);
            nuevoEmpleado.setRhE(rhE);
            nuevoEmpleado.setPasswordE(passwordE);
    
            empleadoService.guardarUsuarioYEmpleado(nuevoEmpleado);
    
            redirectAttributes.addFlashAttribute("mensaje", "Empleado actualizado correctamente.");
        } else {
            redirectAttributes.addFlashAttribute("error", "Empleado no encontrado.");
        }
    
        return "redirect:/TablaEmpleado";
    }

    @GetMapping("/eliminarEmpleado/{id}")
    public String eliminarEmpleado(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        empleadoService.eliminarEmpleado(id);
        redirectAttributes.addFlashAttribute("empleadoEliminado", true);
        return "redirect:/TablaEmpleado";
    }

}
