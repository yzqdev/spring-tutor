package com.yzq.entity;

import java.io.Serializable;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 
 * </p>
 *
 * @author yz
 * @since 2022-01-18
 */
@Getter
@Setter
public class Teacher implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    private String name;

    private String title;


}
