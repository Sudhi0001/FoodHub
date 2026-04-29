package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import dao.FoodDAO;

@WebServlet("/addFood")
public class FoodServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
	        throws ServletException, IOException {

	    String name = req.getParameter("name");
	    String category = req.getParameter("category");
	    double price = Double.parseDouble(req.getParameter("price"));
	    String image = req.getParameter("image_url"); // 👈 NEW

	    FoodDAO.insert(name, category, price, image); // 👈 UPDATED

	    res.sendRedirect(req.getContextPath() + "/dashboard.jsp");
	}
    
}