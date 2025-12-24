<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2>Admin Dashboard</h2>

    
    
<div class = "mb-3">
<a href="/reportdaily" class="btn btn-success btn-sm">Daily Report</a>

<a href = "/reportmonthly" class="btn btn-primary btn-sm">Monthly Report</a>
</div>

    

    <table class="table table-striped table-bordered mt-3">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Customer</th>
                <th>Title</th>
                <th>Status</th>
                <th>Assign</th>
                <th>View</th>
                <th>Action<th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="t" items="${tickets}" varStatus="status">
            <tr>
              <td>${status.index + 1}</td>
                <td>${t.customer.username}</td>
                <td>${t.title}</td>
                <td>${t.status}</td>
               <td>
    <a href="/assignTicket?ticketId=${t.id}"
       class="btn btn-warning btn-sm">Assign</a>
</td>
               
                <td><a href="/ticket/${t.id}" class="btn btn-info btn-sm">Open</a></td>
              <td> <a href="/delete9/${t.customer.id}" onclick="return confirm('Are you sure?')" class="btn btn-danger btn-sm">Delete</a> |
              <a href="/editCustomer/${t.customer.id}"
   class="btn btn-primary btn-sm">Edit</a>
              
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    
    
</div>

</body>
</html>
