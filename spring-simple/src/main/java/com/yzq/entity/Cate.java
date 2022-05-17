package com.yzq.entity;

import java.io.Serializable;
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
public class Cate implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;

    private String name;

    private Integer pid;

    private String intro;


}
