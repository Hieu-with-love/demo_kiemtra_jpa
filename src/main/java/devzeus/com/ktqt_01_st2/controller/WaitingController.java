package devzeus.com.ktqt_01_st2.controller;

import devzeus.com.ktqt_01_st2.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(urlPatterns = {"/waiting"})
public class WaitingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session= req.getSession();
        if(session != null && session.getAttribute("account") != null) {
            User u=(User) session.getAttribute("account");
            req.setAttribute("username", u.getEmail());
            if(u.getIs_admin()) {
                resp.sendRedirect(req.getContextPath()+"/admin/home");
            }else{
                resp.sendRedirect(req.getContextPath()+"/user/home");
            }
        }else {
            resp.sendRedirect(req.getContextPath()+"/login");
        }
    }
}
