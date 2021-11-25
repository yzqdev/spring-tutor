package com.example.springtransfer.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.HashMap;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.atomic.AtomicInteger;

@ServerEndpoint(value = "/ws/asset", encoders = {ServerEncoder.class})
@Component
@Slf4j
public class WebSocketServer {

    @PostConstruct
    public void init() {
        System.out.println("websocket 加载");
    }

    private static final AtomicInteger OnlineCount = new AtomicInteger(0);
    /**
     * concurrent包的线程安全Set，用来存放每个客户端对应的Session对象。
     */
    private static CopyOnWriteArraySet<Session> sessionSet = new CopyOnWriteArraySet<>();


    /**
     * 连接建立成功调用的方法
     */
    @OnOpen
    public void onOpen(Session session) {
        sessionSet.add(session);
        // 在线数加1
        int cnt = OnlineCount.incrementAndGet();
        log.info("有连接加入，当前连接数为：{}", cnt);
        sendMessage(session, "连接成功");
        getSessionId(session);
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(Session session) {
        sessionSet.remove(session);
        int cnt = OnlineCount.decrementAndGet();
        log.info("有连接关闭，当前连接数为：{}", cnt);
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @param message 客户端发送过来的消息
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        log.info("来自客户端的消息：{}", message);
        sendMessage(session, "收到消息，消息内容：" + message);

    }

    /**
     * 出现错误
     *
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error) {
        log.error("发生错误：{}，Session ID： {}", error.getMessage(), session.getId());
        error.printStackTrace();
    }

    /**
     * 发送消息，实践表明，每次浏览器刷新，session会发生变化。
     *
     * @param session
     * @param message
     */
    public static void sendMessage(Session session, String message) {
        try {
            session.getBasicRemote().sendObject(new HashMap<String,Object>(3){{
                put("data", message);
                put("text", String.format("message: %s (From Server，Session ID=%s)", message, session.getId()));
                put("sid", session.getId());
            }});
            //session.getBasicRemote().sendText(String.format("message: %s (From Server，Session ID=%s)", message, session.getId()));
        } catch (IOException | EncodeException e) {
            log.error("发送消息出错：{}", e.getMessage());
            e.printStackTrace();
        }
    }

    public static String getSessionId(Session session) {
        return session.getId();
    }

    /**
     * 群发消息
     *
     * @param message
     * @throws IOException
     */
    public static void broadCastInfo(String message) throws IOException {
        for (Session session : sessionSet) {
            if (session.isOpen()) {
                sendMessage(session, message);
            }
        }
    }

    /**
     * 指定Session发送消息
     *
     * @param sessionId
     * @param message
     * @throws IOException
     */
    public static void sendMessageBySessionId(String message, String sessionId) throws IOException {
        Session session = null;
        for (Session s : sessionSet) {
            if (s.getId().equals(sessionId)) {
                session = s;
                break;
            }
        }
        if (session != null) {
            sendMessage(session, message);
        } else {
            log.warn("没有找到你指定ID的会话：{}", sessionId);
        }
    }

}