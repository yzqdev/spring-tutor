package com.yzq.entity;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 
 * </p>
 *
 * @author y
 * @since 2022-05-17
 */
@Getter
@Setter
public class Teacher implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    private String name;

    private String title;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;


}
