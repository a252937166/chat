package biz;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by OyDn on 2016/4/6.
 */
public class LoginChatServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        User user = new User();
        ServletContext servletContext = req.getServletContext();
        HttpSession session = req.getSession();
        String thePhoto = "<div style='height: 55px;width: 55px;float:left'><img src="+req.getParameter("headPhoto")+" class='img-responsive img-circle' alt='Cinque Terre'></div>";
        ArrayList users = (ArrayList) servletContext.getAttribute("users");
        ArrayList userList = (ArrayList) servletContext.getAttribute("userList");//记录用户账号和昵称
        String showName = req.getParameter("nick");//显示昵称
        if (users == null) {
            servletContext.setAttribute("users",new ArrayList<User>());
            servletContext.setAttribute("userList",new ArrayList<String>());
            users = (ArrayList) servletContext.getAttribute("users");
            userList = (ArrayList) servletContext.getAttribute("userList");
            users.add(thePhoto + "<span style='float: left;line-height: 55px;margin-left: 10px'>"+user.getAccount()+ "</span>");
            userList.add(showName);
            session.setAttribute("user",showName);
            session.setAttribute("thePhoto",thePhoto);
        } else {
            users.add(thePhoto + "<span style='float: left;line-height: 55px;margin-left: 10px'>"+user.getAccount()+ "</span>");
            userList.add(showName);
            session.setAttribute("user",showName);
            session.setAttribute("thePhoto",thePhoto);
        }
        resp.sendRedirect("/webchat/html/chat.html");//跳转聊天界面
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
