package com.example.springtransfer.config;
 
import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

import com.alibaba.fastjson.JSONObject;
import com.example.springtransfer.entity.Messagepojo;

import java.util.HashMap;


/**
 * definition for our encoder
 * 
 * @编写人: 夏小雪 日期:2015年6月14日 时间:上午11:58:23
 */
public class ServerEncoder implements Encoder.Text<HashMap> {
 
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
 
	}
 
	@Override
	public void init(EndpointConfig arg0) {
		// TODO Auto-generated method stub
 
	}
 
	@Override
	public String encode(HashMap hashMap) throws EncodeException {
		try {
			return JSONObject.toJSONString(hashMap, false);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
 
}