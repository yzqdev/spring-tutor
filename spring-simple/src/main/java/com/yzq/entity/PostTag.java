package com.yzq.entity;

import com.baomidou.mybatisplus.annotation.TableName;
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
@TableName("post_tag")
public class PostTag implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    private String postId;

    private String tagId;


}
