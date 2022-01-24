package com.yzq.transfer.controller;

import com.yzq.transfer.config.WebSocketServer;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.HashMap;

@RestController
@RequestMapping("/api/ws")
public class WebSocketController {


    /**
     * 群发消息内容
     * @param message
     * @return
     */
    @RequestMapping(value="/sendAll", method= RequestMethod.GET)
    public HashMap sendAllMessage(@RequestParam("message") String message){
        try {
            WebSocketServer.broadCastInfo(message);
        } catch (IOException e) {
            e.printStackTrace();
        }
        HashMap<String,Object> res=new HashMap<>();
        res.put("code", 200);
        res.put("msg", "ok");
        return res;
    }
    @GetMapping("/sid")
    public HashMap getSid(){
        HashMap<String,Object> res=new HashMap<>();
        res.put("code", 200);
        res.put("msg", "ok");
        res.put("sid", "WebSocketServer.getSessionId()");
        return res;
    }
    
    /**
     * 指定会话ID发消息
     * @param message 消息内容
     * @param id 连接会话ID
     * @return
     */
    @RequestMapping(value="/sendOne", method=RequestMethod.GET)
    public HashMap sendOneMessage(@RequestParam() String message, @RequestParam() String id){
        try {
            WebSocketServer.sendMessageBySessionId(message,id);
        } catch (IOException e) {
            e.printStackTrace();
        }
        HashMap<String,Object> res=new HashMap<>();
        res.put("code", 200);
        res.put("msg", "ok");
        return res;
    }
    @GetMapping("/msg")
    public String sendMsg(){
        return "hhhh";

    }
}