package com.yzq.shirodemo.service;

import com.yzq.shirodemo.entity.UserRole;
import com.yzq.shirodemo.repository.UserRoleRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * UserRoleService
 *
 * @author star
 */
@Service
@RequiredArgsConstructor
public class UserRoleService {


    private final UserRoleRepository userRoleRepository;

    public List<UserRole> listUserRoles(String userName) {
        return userRoleRepository.findByUsername(userName);
    }

    @Transactional(rollbackFor = Exception.class)
    public void deleteByUserName(String userName) {
        userRoleRepository.deleteByUsername(userName);
    }
    public void addUserRole(String username){
        userRoleRepository.save(UserRole.builder().username(username).role("admin").build());
    }
}
