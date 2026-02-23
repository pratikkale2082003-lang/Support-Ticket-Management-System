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
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #4e73df, #1cc88a);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0;
    }

    .login-box {
        width: 370px;
        background: #ffffff;
        padding: 35px;
        border-radius: 15px;
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
        transition: 0.3s ease;
    }

    .login-box:hover {
        transform: translateY(-5px);
    }

    h2 {
        text-align: center;
        margin-bottom: 25px;
        font-weight: 600;
        color: #333;
    }

    label {
        font-weight: 500;
        font-size: 14px;
    }

    input.form-control {
        border-radius: 10px;
        padding: 12px;
        border: 1px solid #ddd;
        transition: 0.3s;
    }

    input.form-control:focus {
        border-color: #4e73df;
        box-shadow: 0 0 5px rgba(78, 115, 223, 0.4);
    }

    button.btn-primary {
        width: 100%;
        padding: 12px;
        border-radius: 10px;
        font-size: 16px;
        font-weight: 600;
        background: #4e73df;
        border: none;
        transition: 0.3s;
    }

    button.btn-primary:hover {
        background: #2e59d9;
        transform: scale(1.03);
    }

    .alert {
        font-size: 14px;
        border-radius: 10px;
    }

    a {
        text-decoration: none;
        font-size: 13px;
        color: #4e73df;
        font-weight: 500;
    }

    a:hover {
        text-decoration: underline;
        color: #2e59d9;
    }

    .text-end {
        margin-top: 10px;
    }

    .register-link {
        text-align: center;
        margin-top: 15px;
        font-size: 14px;
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
        
         <div  class="text-end mt-2">
         <a href = "/forgot-password">Forgot PassWord ? </a>
         </div>
    </form>
<br>
   
        New Register account? <a href="register3">New Register</a>
    </div>

</body>
</html>
