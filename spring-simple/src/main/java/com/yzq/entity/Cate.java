package com.yzq.entity;

import java.io.Serializable;

import lombok.*;

/**
 * <p>
 * 
 * </p>
 *
 * @author y
 * @since 2022-05-17
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Cate implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;

    private String name;

    private Integer pid;

    private String intro;


}
