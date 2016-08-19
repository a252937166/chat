package biz;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 * Created by OyDn on 2016/4/6.
 */
public class SendBizServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        Date date = new Date();
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = format.format(date);
        HttpSession session = req.getSession();
        ServletContext servletContext = req.getServletContext();
        ArrayList messages = (ArrayList) servletContext.getAttribute("messages");
        String[] message = {"<tr><td>" + session.getAttribute("thePhoto") +"<span style='float: left;line-height: 55px;margin-left: 10px'>" + time + "</span>\n" +  "<span style='float: left;line-height: 55px;margin-left: 10px'>" + session.getAttribute("user") +"\n说：</span></td></tr><tr><td style='padding-left:100px;'><span>" + req.getParameter("messages") + "</span>"};
        if (messages == null) {
            servletContext.setAttribute("messages",new ArrayList<User>());
            messages = (ArrayList) servletContext.getAttribute("messages");
            messages.add(message);
            try {
                XMLTest.add((String) session.getAttribute("user"),req.getParameter("messages"),time);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            try {
                XMLTest.add((String) session.getAttribute("user"),req.getParameter("messages"),time);
            } catch (Exception e) {
                e.printStackTrace();
            }
            messages.add(message);
        }
        resp.sendRedirect("/webchat/jsp/send.jsp");
    }
}
