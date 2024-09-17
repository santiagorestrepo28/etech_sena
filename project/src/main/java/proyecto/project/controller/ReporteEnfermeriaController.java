package proyecto.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import jakarta.servlet.http.HttpSession;
import proyecto.project.model.ReporteEnfermeria;
import proyecto.project.model.ReporteEnfermeriaId;
import proyecto.project.service.ReporteEnfermeriaService;

@Controller
public class ReporteEnfermeriaController {

    @Autowired
    private ReporteEnfermeriaService reporteEnfermeriaService;

    @GetMapping("/reporteEnfermeria")
    public String mostrarReporteEnfermeria(HttpSession session, Model model) {
        String nombreAdmin = (String) session.getAttribute("nombreAdmin");
        if (nombreAdmin != null) {
            model.addAttribute("nombreAdmin", nombreAdmin);
        }

        List<ReporteEnfermeria> reporte = reporteEnfermeriaService.obtenerReporteEnfermeria();
        model.addAttribute("reporte", reporte);

        return "reporteEnfermeria";
    }

    @GetMapping("/seleccionarHistoriaParaReporte/{idHistoria}")
    public String seleccionarHistoriaParaReporte(@PathVariable("idHistoria") Long idHistoria, HttpSession session) {
        session.setAttribute("idHistoria", idHistoria);
        return "redirect:/reportePDF"; 
    }

    @GetMapping("/reportePDF")
    public String mostrarReporteEnfermeriaPdf(HttpSession session, Model model) {
        Long idHistoria = (Long) session.getAttribute("idHistoria");

        List<ReporteEnfermeriaId> reportesId
                = reporteEnfermeriaService.obtenerReporteEnfermeriaPorId(idHistoria);

        if (!reportesId.isEmpty()) {
            model.addAttribute("reporte", reportesId.get(0));
            return "reporteEnfermeriaPdf";
        } else {
            return "redirect:/error";
        }
    }

}
