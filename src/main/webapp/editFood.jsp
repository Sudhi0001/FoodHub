<%@ page import="java.sql.*, model.DBConnection" %>

<%
String idParam = request.getParameter("id");

if(idParam == null){
    out.println("Error: No ID provided");
    return;
}

int id = Integer.parseInt(idParam);
Connection con = DBConnection.getConnection();
PreparedStatement ps = con.prepareStatement("SELECT * FROM food WHERE id=?");
ps.setInt(1, id);

ResultSet rs = ps.executeQuery();
rs.next();
%>
<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #ff6a00, #ee0979);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .form-container {
        width: 380px;
        padding: 30px;
        background: white;
        border-radius: 20px;
        box-shadow: 0 15px 40px rgba(0,0,0,0.3);
        animation: fadeIn 0.7s ease;
    }

    .form-container h2 {
        text-align: center;
        font-weight: 600;
        margin-bottom: 20px;
        color: #333;
    }

    .form-control {
        border-radius: 10px;
        padding: 12px;
        font-size: 14px;
    }

    .form-control:focus {
        border-color: #ff6a00;
        box-shadow: 0 0 8px rgba(255,106,0,0.4);
    }

    .btn-update {
        width: 100%;
        background: #ff6a00;
        color: white;
        font-weight: 600;
        border-radius: 10px;
        padding: 10px;
        transition: 0.3s;
    }

    .btn-update:hover {
        background: #ee0979;
        transform: scale(1.05);
    }

    .back-btn {
        margin-top: 10px;
        display: block;
        text-align: center;
        color: #555;
        text-decoration: none;
    }

    .back-btn:hover {
        color: black;
    }

    @keyframes fadeIn {
        from {opacity: 0; transform: translateY(20px);}
        to {opacity: 1; transform: translateY(0);}
    }
</style>

<div class="form-container">

    <h2> Edit Food</h2>

    <form action="<%=request.getContextPath()%>/updateFood" method="post">

        <input type="hidden" name="id" value="<%=id%>">

        <input type="text" name="name" value="<%=rs.getString("name")%>" 
               class="form-control mb-3" placeholder="Food Name">
               <br></br>

        <input type="text" name="category" value="<%=rs.getString("category")%>" 
               class="form-control mb-3" placeholder="Category">
<br></br>
        <input type="number" name="price" value="<%=rs.getDouble("price")%>" 
               class="form-control mb-3" placeholder="Price">
<br></br>
        <button class="btn btn-update">Update</button>

    </form>

    <a href="<%=request.getContextPath()%>/dashboard.jsp" class="back-btn">
        Back to Dashboard
    </a>
    <a href="<%=request.getContextPath()%>/order?name=<%=rs.getString("name")%>&price=<%=rs.getDouble("price")%>" 
   class="btn btn-success btn-sm">
   Order
</a>

</div>