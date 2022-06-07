package com.yzq.shirodemo.repository;

import com.yzq.shirodemo.entity.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;

import java.util.List;

/**
 * UserRoleRepository
 *
 * @author star
 */
public interface UserRoleRepository extends JpaRepository<UserRole, Long> {

    List<UserRole> findByUsername(String username);

    @Modifying
    void deleteByUsername(String username);
}
