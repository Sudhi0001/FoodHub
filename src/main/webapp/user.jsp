<%@ page import="java.sql.*, dao.FoodDAO" %>

<!DOCTYPE html>
<html>
<head>
    <title>Food Menu</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #ff6a00, #ee0979);
            min-height: 100vh;
        }

        .header {
            text-align: center;
            color: white;
            padding: 30px 0;
        }

        .header h2 {
            font-weight: 600;
        }

        .food-card {
            border-radius: 20px;
            overflow: hidden;
            transition: 0.3s;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            background: white;
        }

        .food-card:hover {
            transform: translateY(-8px) scale(1.02);
        }

        .food-img {
            height: 180px;
            background-size: cover;
            background-position: center;
        }

        .food-body {
            padding: 15px;
            text-align: center;
        }

        .price {
            font-weight: bold;
            color: #28a745;
            font-size: 18px;
        }

        .btn-order {
            width: 100%;
            border-radius: 10px;
            background: #ff6a00;
            color: white;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn-order:hover {
            background: #ee0979;
            transform: scale(1.05);
        }
    </style>
</head>

<body>

<div class="header">
    <h2>🍔 Delicious Food Menu</h2>
    <p>Order your favorite meals instantly</p>
</div>

<div class="container">

    <div class="row">

<%
ResultSet rs = FoodDAO.getAll();

while(rs.next()){
%>

    <div class="col-md-4 mb-4">
        <div class="food-card">

            <!-- IMAGE (random food image for now) -->
<%
String img = rs.getString("image_url");

if(img == null || img.trim().isEmpty()){
    img = "https://source.unsplash.com/400x300/?food"; // fallback
}
%>

<img src="<%=img%>" 
     style="width:100%; height:180px; object-fit:cover; border-radius:15px;">
            <div class="food-body">
                <h5><%=rs.getString("name")%></h5>
                <p><%=rs.getString("category")%></p>
                <p class="price">₹ <%=rs.getDouble("price")%></p>

                <a href="<%=request.getContextPath()%>/order?name=<%=rs.getString("name")%>&price=<%=rs.getDouble("price")%>" 
                   class="btn btn-order">
                   Order Now 🍽️
                </a>
            </div>

        </div>
    </div>

<% } %>

    </div>
</div>

</body>
</html>