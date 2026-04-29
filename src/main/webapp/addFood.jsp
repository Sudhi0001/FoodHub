<!DOCTYPE html>
<html>
<head>
    <title>Add Food</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #ff6a00, #ee0979);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-card {
            width: 420px;
            padding: 30px;
            background: white;
            border-radius: 25px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.3);
            animation: fadeIn 0.6s ease;
        }

        .form-card h2 {
            text-align: center;
            font-weight: 600;
            margin-bottom: 25px;
        }

        .form-control {
            border-radius: 12px;
            padding: 12px;
            border: 1px solid #ddd;
            transition: 0.3s;
        }

        .form-control:focus {
            border-color: #ff6a00;
            box-shadow: 0 0 10px rgba(255,106,0,0.4);
        }

        .btn-add {
            width: 100%;
            background: linear-gradient(90deg, #ff6a00, #ee0979);
            color: white;
            font-weight: 600;
            border-radius: 12px;
            padding: 12px;
            border: none;
            transition: 0.3s;
        }

        .btn-add:hover {
            transform: scale(1.05);
        }

        .preview-img {
            width: 100%;
            height: 160px;
            object-fit: cover;
            border-radius: 12px;
            margin-bottom: 15px;
            border: 2px solid #eee;
        }

        .back-btn {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #555;
            text-decoration: none;
        }

        .back-btn:hover {
            color: black;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(30px);}
            to {opacity: 1; transform: translateY(0);}
        }
    </style>
</head>

<body>

<div class="form-card">

    <h2>🍔 Add Food Item</h2>

    <!-- Image Preview -->
    <img id="preview" class="preview-img" 
         src="https://source.unsplash.com/400x300/?food">

    <form action="<%=request.getContextPath()%>/addFood" method="post">

        <input type="text" name="name" class="form-control mb-3" placeholder="Food Name" required>

        <input type="text" name="category" class="form-control mb-3" placeholder="Category" required>

        <input type="number" name="price" class="form-control mb-3" placeholder="Price" required>

        <!-- NEW IMAGE FIELD -->
        <input type="text" name="image_url" id="imgInput"
               class="form-control mb-3"
               placeholder="Paste Image URL (https://...)">

        <button class="btn btn-add">Add Food 🚀</button>

    </form>

    <a href="<%=request.getContextPath()%>/dashboard.jsp" class="back-btn">
        ← Back to Dashboard
    </a>

</div>

<!-- LIVE IMAGE PREVIEW SCRIPT -->
<script>
document.getElementById("imgInput").addEventListener("input", function(){
    document.getElementById("preview").src = this.value;
});
</script>

</body>
</html>