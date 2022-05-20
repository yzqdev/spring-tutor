package com.yzq.entity;

import java.io.Serializable;
import java.time.LocalDateTime;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
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
public class Student implements Serializable {

    private static final long serialVersionUID = 1L;
@TableId(type = IdType.ASSIGN_ID)
    private Integer id;

    private String name;

    private Integer tid;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;


}
