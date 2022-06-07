package com.yzq.shirodemo.repository;

import com.yzq.shirodemo.entity.SysUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;

import java.util.Optional;

/**
 * UserRepository
 *
 * @author star
 */
public interface UserRepository extends JpaRepository<SysUser, String> {

    /**
     * 找到用户名
     *
     * @param email 用户名
     * @return {@link Optional}<{@link SysUser}>
     */
    Optional<SysUser> findByEmail(String email);
    Optional<SysUser> findByUsername(String username);

    @Modifying
    void deleteByUsername(String userName);
}
