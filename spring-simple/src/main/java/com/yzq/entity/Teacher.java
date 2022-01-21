package com.yzq.entity;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Builder;
import lombok.Data;
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
@Data
@Builder
public class Teacher implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;
    @TableId(value = "id",type = IdType.ASSIGN_ID)
    private Integer id;

    private String name;

    private String title;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;

}
