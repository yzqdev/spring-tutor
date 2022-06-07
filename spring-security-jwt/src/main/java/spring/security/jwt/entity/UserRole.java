package spring.security.jwt.entity;

import lombok.*;
import org.hibernate.Hibernate;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Objects;

/**
 * UserRole
 *
 * @author star
 */
@Entity
@Table(name = "user_role")
@Getter
@Setter
@ToString
@Builder
@AllArgsConstructor

@RequiredArgsConstructor
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        UserRole userRole = (UserRole) o;
        return id != null && Objects.equals(id, userRole.id);
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}
