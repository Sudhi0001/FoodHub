<%@ page import="java.sql.*, dao.FoodDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>FoodHub Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #0f172a;
            color: white;
        }

        .navbar {
            background: linear-gradient(90deg, #ff6a00, #ee0979);
        }

        .navbar-brand {
            color: white !important;
            font-weight: 700;
        }

        .hero {
            margin-top: 20px;
            padding: 20px;
            border-radius: 20px;
            background: linear-gradient(135deg,#ff6a00,#ee0979);
            box-shadow: 0 10px 30px rgba(0,0,0,0.4);
        }

        .food-card {
            border-radius: 20px;
            background: rgba(255,255,255,0.1);
            backdrop-filter: blur(10px);
            padding: 20px;
            transition: 0.3s;
        }

        .food-card:hover {
            transform: translateY(-8px);
        }

        .price {
            color: #4ade80;
            font-weight: bold;
        }

        .btn-edit {
            background: #facc15;
            border-radius: 20px;
        }

        .btn-delete {
            background: #ef4444;
            color: white;
            border-radius: 20px;
        }

        .add-btn {
            background: white;
            color: #ee0979;
            border-radius: 20px;
        }
        .food-card img {
    transition: 0.3s;
}

.food-card:hover img {
    transform: scale(1.05);
}

    </style>
</head>

<body>

<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand"><i class="fa-solid fa-burger"></i> FoodHub</a>

        <div class="d-flex gap-2">

            <!-- 🔔 Orders Button -->
            <a href="orders.jsp" class="btn btn-warning position-relative">
     Orders
    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
        !
    </span>
</a>

            <!-- Logout -->
            <a href="login.jsp" class="btn btn-light">
                Logout
            </a>

        </div>
    </div>
</nav>

<div class="container">

    <div class="hero d-flex justify-content-between align-items-center">
        <h3>Food Menu</h3>
        <a href="addFood.jsp" class="btn add-btn">+ Add Item</a>
    </div>

    <div class="row mt-4">

<%
    ResultSet rs = FoodDAO.getAll();
    while(rs.next()){
%>

        <div class="col-md-4 mb-4">
    <div class="food-card text-center">

        <%
        String img = rs.getString("image_url");
        if(img == null || img.trim().isEmpty()){
            img = "https://source.unsplash.com/400x300/?food";
        }
        %>

        <!-- FOOD IMAGE -->
        <img src="<%=img%>" 
             style="width:100%; height:160px; object-fit:cover; border-radius:15px; margin-bottom:10px;">

        <h5 class="mt-2"><%= rs.getString("name") %></h5>
        <p><%= rs.getString("category") %></p>

        <p class="price">₹ <%= rs.getDouble("price") %></p>

        <div class="d-flex justify-content-between mt-3">

            <!-- EDIT -->
            <a href="<%=request.getContextPath()%>/editFood.jsp?id=<%=rs.getInt("id")%>" 
               class="btn btn-warning btn-sm">
               Edit
            </a>

            <!-- DELETE -->
            <a href="<%=request.getContextPath()%>/delete?id=<%=rs.getInt("id")%>" 
               class="btn btn-delete btn-sm"
               onclick="return confirm('Delete this item?');">
               Delete
            </a>

        </div>

    </div>
</div>

<% } %>

    </div>
</div>

</body>
</html>