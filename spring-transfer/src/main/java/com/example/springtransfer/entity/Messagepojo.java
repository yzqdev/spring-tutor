package com.example.springtransfer.entity;
 
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.io.Serializable;
 
/**
 * 发送给ActiveMQ的实体类
 * 
 * @author 夏小雪 日期:2015年6月11日 时间:下午12:14:18
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Messagepojo implements Serializable {
 
	@Serial
	private static final long serialVersionUID = -6451812593150428369L;
 
	private String sourse;// 信息来源
	private String messageType;// 消息类型
	private String msgContent;// 消息内容
	private String target;// 发送目的地
	private String infoSourceIP;// 信息来源ip
	private String createtime;// 消息保存时间
	private String otherContent;// 其他信息

}