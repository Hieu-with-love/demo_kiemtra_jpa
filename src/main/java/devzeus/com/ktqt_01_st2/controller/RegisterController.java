package devzeus.com.ktqt_01_st2.controller;

import devzeus.com.ktqt_01_st2.model.User;
import devzeus.com.ktqt_01_st2.service.UserService;
import devzeus.com.ktqt_01_st2.service.impl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Objects;

@WebServlet(urlPatterns = {"/register", "/dang-ky"})
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        String email = req.getParameter("email");
        String fullName = req.getParameter("fullname");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        String msg = "";

        if (email == null || password == null){
            msg = "Username or password cannot be null";
            req.setAttribute("alert", msg);
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
        }

        User userRegister = userService.register(email, password, fullName, phone);
        if (userRegister == null || !Objects.equals(password, confirmPassword)){
            msg = "Username or password incorrect";
            req.setAttribute("alert", msg);
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
        }else{
            msg = "Registration successful";
            req.setAttribute("alert", msg);
            resp.sendRedirect(req.getContextPath() + "/login");
        }
    }
}
