package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import dao.OrderDAO;

@WebServlet("/updateStatus")
public class UpdateStatusServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            System.out.println("✅ Servlet HIT");

            String idParam = req.getParameter("id");

            if (idParam == null || idParam.isEmpty()) {
                System.out.println("❌ ID missing in request");
                res.getWriter().println("Error: ID not provided");
                return;
            }

            int id = Integer.parseInt(idParam);
            System.out.println("👉 Updating order ID: " + id);

            boolean updated = OrderDAO.updateStatus(id);

            if (updated) {
                System.out.println("✅ Order status updated");
            } else {
                System.out.println("❌ No rows updated (check ID)");
            }

            // redirect back
            res.sendRedirect(req.getContextPath() + "/orders.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("❌ Error in UpdateStatusServlet");
        }
    }
}