package proyecto.project.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "parentesco")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Parentesco {

    @Id
    @Column(name = "ID_PARENTESCO")
    private Integer idParentesco;

    @Column(name = "T_PARENTESCO")
    private String tParentesco;
}
