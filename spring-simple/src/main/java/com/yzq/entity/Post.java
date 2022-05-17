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
public class Post implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    private String cateId;

    private String userId;

    /**
     * 0 为文章，1 为页面
     */
    private Integer type;

    /**
     * 0 为草稿，1 为待审核，2 为已拒绝，3 为已经发布
     */
    private Integer status;

    private String title;

    /**
     * URL 的 pathname
     */
    private String path;

    /**
     * 摘要
     */
    private String summary;

    private String markdownContent;

    private String content;

    /**
     * 1 为允许， 0 为不允许
     */
    private Integer allowComment;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

    /**
     * 1 为公开，0 为不公开
     */
    private Integer isPublic;

    private Integer commentNum;

    /**
     * 一些选项，JSON 结构
     */
    private String options;


}
