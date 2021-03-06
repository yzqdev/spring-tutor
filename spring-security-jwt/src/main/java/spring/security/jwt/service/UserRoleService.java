package spring.security.jwt.service;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import spring.security.jwt.entity.UserRole;
import spring.security.jwt.repository.UserRoleRepository;

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
