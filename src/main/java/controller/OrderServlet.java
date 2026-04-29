package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import dao.OrderDAO;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));

        OrderDAO.insert(name, price);

        res.sendRedirect(req.getContextPath() + "/dashboard.jsp");
    }
}