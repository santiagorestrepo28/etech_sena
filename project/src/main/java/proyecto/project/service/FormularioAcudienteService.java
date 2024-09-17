package proyecto.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proyecto.project.model.FormularioAcudiente;
import proyecto.project.repository.FormularioCRepository;


@Service
public class FormularioAcudienteService {
    @Autowired
    private FormularioCRepository formularioCRepository;

    public List<FormularioAcudiente>findAll(){
        return formularioCRepository.findAll();
    }

    public FormularioAcudiente save(FormularioAcudiente acudiente){
        return formularioCRepository.save(acudiente);
    }

}
