package spring.security.jwt.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import spring.security.jwt.constant.UserRoleConstants;
import spring.security.jwt.dto.UserDTO;
import spring.security.jwt.dto.UserRegisterDTO;
import spring.security.jwt.entity.SysUser;
import spring.security.jwt.entity.UserRole;
import spring.security.jwt.config.exception.AlreadyExistsException;
import spring.security.jwt.repository.UserRepository;
import spring.security.jwt.repository.UserRoleRepository;
import spring.security.jwt.service.mapper.UserConverter;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * UserService
 *
 * @author star
 */
@Service
@Slf4j
public class UserService {


    private final UserConverter userConverter;


    private final UserRepository userRepository;


    private final BCryptPasswordEncoder bCryptPasswordEncoder;
    private final UserRoleRepository userRoleRepository;
    public UserService(UserConverter userConverter, UserRepository userRepository, BCryptPasswordEncoder bCryptPasswordEncoder, UserRoleRepository userRoleRepository) {
        this.userConverter = userConverter;
        this.userRepository = userRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
        this.userRoleRepository = userRoleRepository;
    }




    @Transactional(rollbackFor = Exception.class)
    public SysUser register(UserRegisterDTO dto) {
        // 预检查用户名是否存在n
        Optional<SysUser> userOptional = this.getUserByName(dto.getUsername());

        if (userOptional.isPresent()) {
            throw new AlreadyExistsException("用户已存在.");
        }
        SysUser sysUser = userConverter.convertOfUserRegisterDTO(dto);
        log.info("sysuer={}",sysUser.toString());
        // 将登录密码进行加密
        String cryptPassword = bCryptPasswordEncoder.encode(dto.getPassword());
        sysUser.setPassword(cryptPassword);
        try {
            userRepository.save(sysUser);
            userRoleRepository.save(UserRole.builder().id(null).username(sysUser.getUsername()).role(UserRoleConstants.ROLE_ADMIN).build());
            return  sysUser;
        } catch (DataIntegrityViolationException e) {
            // 如果预检查没有检查到重复，就利用数据库的完整性检查
            throw new AlreadyExistsException("Save failed, the sysUser name already exist.");

        }
    }

    public Optional<SysUser> getUserByName(String userName) {
        return userRepository.findByUsername(userName);

    }

    public UserDTO getUserInfoByName(String userName) {
        Optional<SysUser> userOptional = this.getUserByName(userName);
        if (!userOptional.isPresent()) {
            throw new UsernameNotFoundException("SysUser not found with sysUser name: " + userName);
        }
        // 获取用户角色
        List<String> roles = this.listUserRoles(userName);
        SysUser sysUser = userOptional.get();
        // 设置用户信息
        UserDTO userDTO = new UserDTO();
        userDTO.setUsername(sysUser.getUsername());
        userDTO.setEmail(sysUser.getEmail());
        userDTO.setRoles(roles);

        return userDTO;
    }

    public List<String> listUserRoles(String userName) {
        return userRoleRepository.findByUsername(userName)
                .stream()
                .map(UserRole::getRole)
                .collect(Collectors.toList());
    }

    @Transactional(rollbackFor = Exception.class)
    public void delete(String userName) {
        // 删除用户角色信息
        userRoleRepository.deleteByUsername(userName);
        // 删除用户基本信息
        userRepository.deleteByUsername(userName);
    }
}
