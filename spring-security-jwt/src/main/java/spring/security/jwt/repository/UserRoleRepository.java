package spring.security.jwt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import spring.security.jwt.entity.UserRole;

import java.util.List;

/**
 * UserRoleRepository
 *
 * @author star
 */
public interface UserRoleRepository extends JpaRepository<UserRole, Long> {

    List<UserRole> findByUsername(String userName);

    @Modifying
    void deleteByUsername(String userName);
}
