<%@ page import="java.sql.*, model.DBConnection" %>

<%
Connection con = DBConnection.getConnection();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM orders WHERE status='Pending'");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Orders</title>
    <meta http-equiv="refresh" content="5">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

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
            font-weight: 600;
            color: white !important;
        }

        .container-box {
            margin-top: 30px;
            background: rgba(255,255,255,0.08);
            padding: 25px;
            border-radius: 20px;
            backdrop-filter: blur(10px);
        }

        .table {
            border-radius: 10px;
            overflow: hidden;
        }

        .table th {
            background: #ff6a00;
            color: white;
            text-align: center;
        }

        .table td {
            text-align: center;
            vertical-align: middle;
            background: rgba(255,255,255,0.05);
            color: white;
        }

        .status {
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .pending {
            background: #facc15;
            color: black;
        }

        .completed {
            background: #22c55e;
        }

        .btn-back {
            margin-top: 15px;
        }

    </style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand">📦 Orders Panel</a>
        <a href="dashboard.jsp" class="btn btn-light">⬅ Back</a>
    </div>
</nav>

<div class="container">

    <div class="container-box">

        <h3 class="mb-4">📋 All Orders</h3>

        <table class="table table-bordered">

<tr>
    <th>ID</th>
    <th>Food</th>
    <th>Price</th>
    <th>Status</th>
    <th>Action</th> <!-- added -->
</tr>

<%
while(rs.next()){
    String status = rs.getString("status");
%>

<tr>
    <td><%=rs.getInt("id")%></td>
    <td><%=rs.getString("food_name")%></td>
    <td>₹ <%=rs.getDouble("price")%></td>

    <!-- STATUS -->
    <td>
        <span class="status <%= status.equals("Pending") ? "pending" : "completed" %>">
            <%= status %>
        </span>
    </td>

    <!-- ACTION BUTTON -->
    <td>
        <% if(status.equals("Pending")){ %>
            <a href="<%=request.getContextPath()%>/updateStatus?id=<%=rs.getInt("id")%>" 
               class="btn btn-success btn-sm">
               ✔ Complete
            </a>
        <% } else { %>
            <span class="badge bg-success">Done</span>
        <% } %>
    </td>
</tr>

<% } %>

</table>

    </div>

</div>

</body>
</html>