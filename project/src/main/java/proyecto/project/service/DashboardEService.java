package proyecto.project.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proyecto.project.repository.DashboardERepository;

@Service
public class DashboardEService {

    @Autowired
    private DashboardERepository dashboardERepository;

    public List<Object[]> obtenerTodosLosAgendamientosEmpleado(int identificacionEmpleado) {
        List<Object[]> resultados = dashboardERepository.ejecutarAgendamientoEmpleado(identificacionEmpleado);
        
        // Invierte la lista para que el último agendamiento aparezca primero
        Collections.reverse(resultados);
        
        return resultados;
    }
    
}
