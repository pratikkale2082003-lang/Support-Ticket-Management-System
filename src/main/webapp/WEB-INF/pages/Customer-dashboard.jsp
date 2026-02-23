<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<%@ include file="header.jsp" %>
    <title>Customer Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <style>
        body {
            background: linear-gradient(to right, #e3f2fd, #f8f9fa);
        }

        .dashboard-card {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        }

        .profile-img {
            object-fit: cover;
            border: 3px solid #0d6efd;
            transition: 0.3s;
        }

        .profile-img:hover {
            transform: scale(1.05);
        }

        .table thead {
            background-color: #0d6efd;
            color: white;
        }

        .btn-primary {
            border-radius: 25px;
            padding: 8px 20px;
        }

        .btn-info {
            border-radius: 20px;
        }

        .admin-link {
            text-decoration: none;
            font-weight: 600;
        }

        .admin-link:hover {
            color: #0d6efd;
        }
    </style>
</head>
<body>

<div class="container mt-4">
   
  <h2 class="mb-3">Welcome, ${user.username}👋</h2>

    <!-- ================= PROFILE IMAGE ================= -->
    <c:choose>
        <c:when test="${not empty user.image}">
            <img src="${pageContext.request.contextPath}/user/image/${user.id}"
                 width="120"
                 height="120"
                 class="rounded-circle mb-3"
                 style="object-fit:cover; border:2px solid #333;"/>
        </c:when>
        <c:otherwise>
            <!-- Default image if no image uploaded -->
            <img src="https://via.placeholder.com/120"
                 class="rounded-circle mb-3"/>
        </c:otherwise>
    </c:choose>

    <hr>
    
    
    
    
    <a href="/ticket/create" class="btn btn-primary mt-3">Create New Ticket</a>
    <hr>
    <h4>Your Tickets</h4>
  <table class="table table-bordered table-striped mt-3">
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Title</th>
            <th>Status</th>
            <th>View</th>
           
        </tr>
    </thead>
    <tbody>
    <c:forEach var="t" items="${tickets}">
        <tr>
            <td>${t.id}</td>
            <td>${t.customer.username}</td>
            <td>${t.title}</td>
            <td>${t.status}</td>
            <td><a class="btn btn-info btn-sm" href="/ticket/${t.id}">Open</a></td>
           
        </tr>
    </c:forEach>
    </tbody>
</table>
  
    
    <a href = "/admin-dashboard">Admin Dashboard</a>
</div>
</body>
</html>
