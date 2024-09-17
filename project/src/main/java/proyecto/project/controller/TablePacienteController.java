package proyecto.project.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import proyecto.project.service.UsuarioPacienteService;

@Controller
public class TablePacienteController {

    @Autowired
    private UsuarioPacienteService usuarioPacienteService;

    @GetMapping("/TablaPaciente")
    public String mostrarTablaPaciente(HttpSession session, Model model) {
        String nombreAdmin = (String) session.getAttribute("nombreAdmin");
        if (nombreAdmin != null) {
            model.addAttribute("nombreAdmin", nombreAdmin);

            List<Object[]> pacientes = usuarioPacienteService.obtenerPacientes();
            model.addAttribute("pacientes", pacientes);
        }
        return "tablaPaciente";
    }

    @GetMapping("/seleccionarPaciente/{id}")
    public String seleccionarPacienteParaInfo(@PathVariable("id") Long id, HttpSession session) {
        session.setAttribute("pacienteId", id);
        session.setAttribute("vista", "vista1");
        return "redirect:/InfoPaciente";
    }

    @GetMapping("/InfoPaciente")
    public String mostrarDetallePaciente(@RequestParam(value = "vista", required = false) String vista,
            HttpSession session, Model model) {
        Long id = (Long) session.getAttribute("pacienteId");

        if (vista != null) {
            session.setAttribute("vista", vista);
        } else {
            vista = (String) session.getAttribute("vista");
        }

        if (id == null) {
            return "redirect:/TablaPaciente";
        }

        Object[] paciente = usuarioPacienteService.obtenerPacientePorId(id);
        if (paciente != null) {
            model.addAttribute("paciente", paciente);

            return switch (vista) {
                case "vista1" ->
                    "formularioPacienteInfo";
                case "vista2" ->
                    "formularioPaciente2Info";
                case "acudiente" ->
                    "formularioAcudienteInfo";
                default ->
                    "formularioPacienteInfoDefault";
            };
        } else {
            return "redirect:/TablaPaciente";
        }
    }

    @GetMapping("/seleccionarPacienteEditar/{id}")
    public String seleccionarPacienteParaEditar(@PathVariable("id") Long id, HttpSession session) {
        session.setAttribute("pacienteId", id);
        return "redirect:/editarPaciente";
    }

    @GetMapping("/editarPaciente")
    public String editarPaciente(HttpSession session, Model model) {
        Long id = (Long) session.getAttribute("pacienteId");

        if (id == null) {
            return "redirect:/TablaPaciente";
        }

        Object[] paciente = usuarioPacienteService.obtenerPacientePorId(id);

        if (paciente != null) {
            model.addAttribute("paciente", paciente);
            session.setAttribute("paciente", paciente);
            return "formularioPacienteEdit";
        } else {
            return "redirect:/TablaPaciente";
        }
    }

    @PostMapping("/EnviarPaciente")
    public String guardarDatosPaciente(
            @RequestParam("nombreP") String nombreP,
            @RequestParam("apellidoP") String apellidoP,
            @RequestParam("tId") String tId,
            @RequestParam("identificacionP") Long identificacionP, 
            @RequestParam("direccionP") String direccionP,
            @RequestParam("sexo") String sexo,
            @RequestParam("edad") int edad,
            @RequestParam("fNac") String fNac,
            HttpSession session) {

        Object[] paciente = (Object[]) session.getAttribute("paciente");

        if (paciente != null) {
            paciente[2] = nombreP;
            paciente[3] = apellidoP;
            paciente[1] = tId;
            paciente[0] = identificacionP; 
            paciente[4] = direccionP;
            paciente[6] = sexo;
            paciente[7] = edad;
            paciente[8] = fNac;

            session.setAttribute("paciente", paciente);
        }

        return "redirect:/editarHistoria";
    }

    @GetMapping("/editarHistoria")
    public String editarHistoria(HttpSession session, Model model) {
        Object[] paciente = (Object[]) session.getAttribute("paciente");

        if (paciente == null) {
            return "redirect:/TablaPaciente";
        }

        model.addAttribute("paciente", paciente);
        return "formularioPaciente2Edit";
    }

    @PostMapping("/EnviarHistoria")
    public String guardarHistoriaMedica(
            @RequestParam("idEps") Long idEps, 
            @RequestParam("rhP") String rhP,
            @RequestParam("panal") String panal,
            @RequestParam("marcaPasos") String marcaPasos,
            @RequestParam("audifonos") String audifonos,
            @RequestParam("protesisDental") String protesisDental,
            @RequestParam("alergia") String alergia,
            @RequestParam("nivelAutonomia") String nivelAutonomia,
            @RequestParam("nivelAlimentacion") String nivelAlimentacion,
            @RequestParam("nivelBano") String nivelBano,
            @RequestParam("antMed") MultipartFile antMedFile,
            HttpSession session) {

        try {
            byte[] antMed = antMedFile.isEmpty() ? null : antMedFile.getBytes();
            Object[] paciente = (Object[]) session.getAttribute("paciente");

            if (paciente != null) {
                paciente[19] = idEps;  
                paciente[5] = rhP;
                paciente[14] = panal;
                paciente[16] = marcaPasos;
                paciente[15] = audifonos;
                paciente[17] = protesisDental;
                paciente[9] = alergia;
                paciente[12] = nivelAutonomia;
                paciente[10] = nivelAlimentacion;
                paciente[11] = nivelBano;
                paciente[13] = antMed;

                session.setAttribute("paciente", paciente);
            }
        } catch (IOException e) {
            return "redirect:/editarHistoria?error";
        }

        return "redirect:/editarAcudiente";
    }

    @GetMapping("/editarAcudiente")
    public String editarAcudiente(HttpSession session, Model model) {
        Object[] paciente = (Object[]) session.getAttribute("paciente");

        if (paciente == null) {
            return "redirect:/TablaPaciente";
        }

        model.addAttribute("paciente", paciente);
        return "formularioAcudienteEdit";
    }

    @PostMapping("/EnviarAcudiente")
    public String guardarDatosAcudiente(
            @RequestParam("nombreA") String nombreA,
            @RequestParam("apellidoA") String apellidoA,
            @RequestParam("identificacionC") Long identificacionC, 
            @RequestParam("telefonoA") String telefonoA,
            @RequestParam("correoA") String correoA,
            @RequestParam("direccionA") String direccionA,
            @RequestParam("ciudadA") String ciudadA,
            @RequestParam("parentesco") Long parentesco, 
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        Object[] paciente = (Object[]) session.getAttribute("paciente");

        if (paciente != null) {
            paciente[22] = nombreA;
            paciente[23] = apellidoA;
            paciente[21] = identificacionC;  
            paciente[24] = telefonoA;
            paciente[25] = correoA;
            paciente[27] = direccionA;
            paciente[26] = ciudadA;
            paciente[20] = parentesco;  

            session.setAttribute("paciente", paciente);

            Long identificacionP = (Long) paciente[0];
            String tId = (String) paciente[1];
            String nombreP = (String) paciente[2];
            String apellidoP = (String) paciente[3];
            String direccionP = (String) paciente[4];
            String sexo = (String) paciente[6];
            int edad = (int) paciente[7];
            String fNac = (String) paciente[8];
            Long idEps = (Long) paciente[19];  
            String rhP = (String) paciente[5];
            String panal = (String) paciente[14];
            String marcaPasos = (String) paciente[16];
            String audifonos = (String) paciente[15];
            String protesisDental = (String) paciente[17];
            String alergia = (String) paciente[9];
            String nivelAutonomia = (String) paciente[12];
            String nivelAlimentacion = (String) paciente[10];
            String nivelBano = (String) paciente[11];
            byte[] antMed = (byte[]) paciente[13];
            Long idAcudiente = (Long) paciente[20];  

            Long identificacionOriginal = (Long) session.getAttribute("pacienteId");
            if (!identificacionP.equals(identificacionOriginal)) {
                usuarioPacienteService.borrarPacienteYAcudiente(identificacionOriginal, idAcudiente);
            }

            usuarioPacienteService.editarPaciente(
                    identificacionP, tId, nombreP, apellidoP, direccionP, rhP, idEps, sexo, edad,
                    Date.valueOf(fNac), alergia, nivelAlimentacion, nivelBano, nivelAutonomia, antMed,
                    panal, audifonos, marcaPasos, protesisDental, identificacionC, parentesco, nombreA,
                    apellidoA, telefonoA, correoA, ciudadA, direccionA);
        }

        redirectAttributes.addFlashAttribute("mensaje", "Paciente actualizado correctamente.");
        return "redirect:/TablaPaciente";
    }

    @GetMapping("/eliminarPaciente/{id}")
    public String eliminarPaciente(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        usuarioPacienteService.eliminarPaciente(id);
        redirectAttributes.addFlashAttribute("pacienteEliminado", true);
        return "redirect:/TablaPaciente";
    }

    @GetMapping("/descargarPdfPaciente")
    public ResponseEntity<ByteArrayResource> descargarPdf(HttpSession session) throws IOException {
        Long id = (Long) session.getAttribute("pacienteId");

        if (id == null) {
            return ResponseEntity.badRequest().build();
        }

        Object[] pacienteData = usuarioPacienteService.obtenerPacientePorId(id);

        if (pacienteData == null) {
            return ResponseEntity.notFound().build();
        }

        byte[] historialMedicoPdf = (byte[]) pacienteData[13];

        if (historialMedicoPdf == null || historialMedicoPdf.length == 0) {
            return ResponseEntity.notFound().build();
        }

        ByteArrayResource resource = new ByteArrayResource(historialMedicoPdf);

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=historial_" + id + ".pdf")
                .contentType(org.springframework.http.MediaType.APPLICATION_PDF)
                .contentLength(historialMedicoPdf.length)
                .body(resource);
    }

}
