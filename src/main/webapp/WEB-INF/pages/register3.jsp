<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Customer Registration</title>

    <link rel="stylesheet"
     href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        body {
            background: linear-gradient(135deg, #4facfe, #00f2fe);
            font-family: 'Segoe UI', Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
            width: 400px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }
    </style>
</head>

<body>

<div class="form-container">

    <h2>Customer Registration</h2>

    <!-- ✅ IMPORTANT: use context path -->
    <form action="${pageContext.request.contextPath}/register3"
          method="post"
          enctype="multipart/form-data">

        <!-- Username -->
        <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text"
                   name="username"
                   class="form-control"
                   required>
        </div>

        <!-- Password -->
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password"
                   name="password"
                   class="form-control"
                   required>
        </div>

        <!-- Phone -->
        <div class="mb-3">
            <label class="form-label">Phone Number</label>
            <input type="text"
                   name="phone"
                   class="form-control"
                   required>
        </div>

        <!-- Image Upload -->
        <div class="mb-3">
            <label class="form-label">Upload Profile Image</label>
            <input type="file"
                   name="imageFile"
                   class="form-control"
                   accept="image/*"
                   required>
        </div>

        <!-- Submit -->
        <button type="submit"
                class="btn btn-primary w-100">
            Register
        </button>

    </form>

    <!-- Login Link -->
    <div class="mt-3 text-center">
        Already have an account?
        <a href="${pageContext.request.contextPath}/login2">
            Login Here
        </a>
    </div>

</div>

</body>
</html>
