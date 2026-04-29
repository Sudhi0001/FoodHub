package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import dao.FoodDAO;

@WebServlet("/updateFood")
public class UpdateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String category = req.getParameter("category");
            double price = Double.parseDouble(req.getParameter("price"));
            String image = req.getParameter("image_url");

            FoodDAO.update(id, name, category, price,image);

            // 🔁 redirect correctly
            res.sendRedirect(req.getContextPath() + "/dashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error updating food item");
        }
    }
}