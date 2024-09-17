package proyecto.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;
import proyecto.project.service.DashboardEService;

@Controller
public class DashboardEController {

    @Autowired
    private DashboardEService dashboardEService;


    @GetMapping("/dashboardE")
    public String mostrarDashboardEmpleado(HttpSession session, Model model) {
        Long identificacionEmpleado = (Long) session.getAttribute("identificacionEmpleado");
        
        if (identificacionEmpleado != null && identificacionEmpleado > 0) {
            List<Object[]> agendamientos = dashboardEService.obtenerTodosLosAgendamientosEmpleado(identificacionEmpleado.intValue());
            
            if (agendamientos == null || agendamientos.isEmpty()) {
                model.addAttribute("error", "No se encontraron agendamientos para este empleado.");
            } else {
                model.addAttribute("agendamientos", agendamientos);
                
                model.addAttribute("ultimoAgendamiento", agendamientos.get(0)); 
            }
            
            model.addAttribute("identificacionEmpleado", identificacionEmpleado);
        } else {
            return "redirect:/loginE";
        }
    
        return "dashboardE";
    }
    
    
    
    
}
