<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #eef2f7;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-box {
            width: 350px;
            background: #ffffff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0px 3px 15px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-weight: 600;
            color: #333;
        }

        input.form-control {
            border-radius: 8px;
            padding: 10px;
        }

        button.btn-primary {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            font-size: 16px;
        }

        button.btn-primary:hover {
            background: #0056b3;
        }

        .alert {
            font-size: 14px;
            border-radius: 8px;
        }

        .sample-text {
            text-align: center;
            font-size: 13px;
            margin-top: 10px;
            color: #666;
        }
    </style>

</head>
<body>

<div class="login-box">
    <h2>Login</h2>

    <!-- Error message -->
    <c:if test="${not empty sessionScope.error}">
        <div class="alert alert-danger">${sessionScope.error}</div>
    </c:if>

    <!-- Login Form -->
    <form method="post" action="/login2">
        <div class="mb-2">
            <label>Username</label>
            <input class="form-control" name="username" required />
        </div>

        <div class="mb-2">
            <label>Password</label>
            <input type="password" class="form-control" name="password" required />
        </div>

        <button class="btn btn-primary" type="submit">Login</button>
    </form>
<br>
   
        New Register account? <a href="register3">New Register</a>
    </div>
</div>

</body>
</html>
