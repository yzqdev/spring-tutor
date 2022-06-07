package spring.security.jwt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import spring.security.jwt.entity.SysUser;

import java.util.Optional;

/**
 * UserRepository
 *
 * @author star
 */
public interface UserRepository extends JpaRepository<SysUser, Long> {

    /**
     * 找到用户名
     *
     * @param userName 用户名
     * @return {@link Optional}<{@link SysUser}>
     */
    Optional<SysUser> findByUsername(String userName);

    @Modifying
    void deleteByUsername(String userName);
}
