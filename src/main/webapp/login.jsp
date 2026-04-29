<!DOCTYPE html>
<html>
<head>
    <title>Food Ordering Login</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            height: 100vh;
            background: linear-gradient(135deg, #ff6a00, #ee0979);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-card {
            width: 380px;
            padding: 30px;
            border-radius: 20px;
            background: white;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            animation: fadeIn 1s ease;
        }

        .login-card h2 {
            font-weight: 600;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-control {
            border-radius: 10px;
            padding: 12px;
        }

        .btn-login {
            width: 100%;
            border-radius: 10px;
            background: #ff6a00;
            color: white;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn-login:hover {
            background: #ee0979;
            transform: scale(1.05);
        }

        .error-msg {
            color: red;
            text-align: center;
            margin-top: 10px;
        }

        .logo {
            text-align: center;
            font-size: 30px;
            margin-bottom: 10px;
        }

        .logo span {
            color: #ff6a00;
            font-weight: bold;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(20px);}
            to {opacity: 1; transform: translateY(0);}
        }
    </style>
</head>

<body>

<div class="login-card">

    <div class="logo">
         <span>FoodHub</span>
    </div>

    <h2>Welcome Back</h2>

<form action="<%=request.getContextPath()%>/login" method="post">
        <input type="text" name="username" class="form-control mb-3" placeholder="Username" required>

        <input type="password" name="password" class="form-control mb-3" placeholder="Password" required>

        <button class="btn btn-login">Login</button>
<a href="user.jsp" class="btn btn-info">User View</a>
    </form>

    <div class="error-msg">${error}</div>

</div>

</body>
</html>