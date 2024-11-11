package devzeus.com.ktqt_01_st2.controller;

import devzeus.com.ktqt_01_st2.model.User;
import devzeus.com.ktqt_01_st2.service.UserService;
import devzeus.com.ktqt_01_st2.service.impl.UserServiceImpl;
import devzeus.com.ktqt_01_st2.utils.Constant;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(urlPatterns = {"/login"})
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String remember = req.getParameter("remember");
        boolean isRememberMe = remember.equals("on");

        String msg = "This is default message";
        if (username == null || password == null){
            msg = "Username or password cannot be null";
            req.setAttribute("alert", msg);
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        }
        User user = userService.login(username, password);
        if (user == null){
            msg = "Tài khoản hoặc mật khẩu không đúng";
            req.setAttribute("alert", msg);
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        }else{
            HttpSession session = req.getSession(true);
            session.setAttribute("account", user);
            if(isRememberMe){
                saveRememberMe(resp, username);
            }
            resp.sendRedirect(req.getContextPath()+"/waiting");
        }
    }
    private void saveRememberMe(HttpServletResponse response, String username){
        Cookie cookie = new Cookie(Constant.COOKIE_REMEMBER, username);
        cookie.setMaxAge(30*60);
        response.addCookie(cookie);
    }
}
