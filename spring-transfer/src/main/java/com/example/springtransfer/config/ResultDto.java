package com.example.springtransfer.config;

import lombok.Data;

/**
 * @author yanni
 * @date time 2021/11/27 17:20
 * @modified By:
 */
@Data
public class ResultDto  {
    private Integer code;
    private String message;
    private Object data;
}
