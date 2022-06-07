package com.yzq.shirodemo.entity;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.Hibernate;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Objects;

/**
 * SysUser
 *
 * @author star
 */
@Entity
@Table(name = "sys_user")
@Getter
@Setter
@ToString
@RequiredArgsConstructor

public class SysUser extends AbstractAuditingEntity {

    private static final long serialVersionUID = 3340373364530753417L;

    @Id
    @GenericGenerator(name = "idGenerator", strategy = "com.yzq.shirodemo.util.SnowFlakeIdGenerator")
    @GeneratedValue(generator = "idGenerator")
    private String id;

    @Column(name = "username", columnDefinition="varchar(30)", nullable = false, unique = true)
    private String username;

    @Column(name = "nickname", columnDefinition = "varchar(30)")
    private String nickname;

    @Column(name = "password", columnDefinition = "varchar(68)", nullable = false)
    private String password;

    @Column(name = "email", columnDefinition = "varchar(40)", nullable = false)
    private String email;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        SysUser sysUser = (SysUser) o;
        return id != null && Objects.equals(id, sysUser.id);
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}
