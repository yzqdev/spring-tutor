package com.yzq.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
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
public class Opts implements Serializable {

    private static final long serialVersionUID = 1L;
@TableId(type = IdType.ASSIGN_ID)
private String id;
    private String key;

    private String value;

    private String intro;


}
