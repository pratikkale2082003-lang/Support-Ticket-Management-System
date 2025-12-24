<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<%@ include file="header.jsp" %>
    <title>Customer Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-4">
    <h2>Welcome, ${user.username}</h2>
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
