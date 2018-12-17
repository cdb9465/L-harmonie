package chat;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
 
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
 

/*클라이언트에서 접속할 서버 주소*/
@ServerEndpoint("/broadcasting")
public class BroadSocket {
    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
    
    /*메시지가 도착했을 시 처리*/
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        /*System.out.println(message);*/
        synchronized(clients) {
            for(Session client : clients) {
                if(!client.equals(session)) {
                    client.getBasicRemote().sendText(message);
                }
            }
        }
    }
    
    
    /*클라이언트가 접속을 할 때와 접속이 끊어졌을떄의 처리*/
    @OnOpen
    public void onOpen(Session session) {
        /*System.out.println(session);*/
        clients.add(session);
    }
    
    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
    }
}
