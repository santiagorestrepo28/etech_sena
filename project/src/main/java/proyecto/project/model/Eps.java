package proyecto.project.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "eps")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Eps {

    @Id
    @Column(name = "ID_EPS")
    private Integer idEps;

    @Column(name = "EPS")
    private String eps;
}
