package proyecto.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proyecto.project.model.ReporteEnfermeria;
import proyecto.project.model.ReporteEnfermeriaId;
import proyecto.project.repository.ReporteEnfermeriaRepository;

@Service
public class ReporteEnfermeriaService {
    
    @Autowired
    private ReporteEnfermeriaRepository reporteEnfermeriaRepository;

    public List<ReporteEnfermeria> obtenerReporteEnfermeria() {
        return reporteEnfermeriaRepository.obtenerReporteEnfermeria();
    }

    public List<ReporteEnfermeriaId> obtenerReporteEnfermeriaPorId(long idHistoriaClinica) {
        return reporteEnfermeriaRepository.obtenerReporteEnfermeriaPorId(idHistoriaClinica);
    }
    

}
