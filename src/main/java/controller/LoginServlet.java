package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import dao.LoginDAO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (LoginDAO.validate(username, password)) {
        	res.sendRedirect(req.getContextPath() + "/dashboard.jsp");}
   else { 
            req.setAttribute("error", "Invalid User");
            req.getRequestDispatcher("jsp/login.jsp").forward(req, res);
        }
    }
}