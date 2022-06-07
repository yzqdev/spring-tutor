package spring.security.jwt.entity;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * UserRole
 *
 * @author star
 */
@Entity
@Table(name = "user_role")
@Data
public class UserRole extends AbstractAuditingEntity {

    private static final long serialVersionUID = 1997955934111931587L;

    @Id
    @GenericGenerator(name = "idGenerator", strategy = "spring.security.jwt.util.SnowFlakeIdGenerator")
    @GeneratedValue(generator = "idGenerator")
    private String id;

    @Column(name = "username", nullable = false)
    private String username;

    @Column(name = "role", length = 15, nullable = false)
    private String role;

}
