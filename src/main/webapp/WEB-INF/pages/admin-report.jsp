<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket Report</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        padding: 20px;
    }

    h3 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    table {
        width: 90%;
        margin: auto;
        border-collapse: collapse;
        background-color: white;
    }

    th, td {
        border: 1px solid #ccc;
        padding: 10px;
        text-align: center;
    }

    th {
        background-color: #333;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    a.btn {
        display: inline-block;
        margin: 20px auto;
        padding: 8px 15px;
        background-color: #6c757d;
        color: white;
        text-decoration: none;
        border-radius: 4px;
    }

    a.btn:hover {
        background-color: #5a6268;
    }

    .center {
        text-align: center;
    }
</style>

</head>
<body>

<h3>${reportType}</h3>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Customer</th>
            <th>Title</th>
            <th>Status</th>
            <th>Assigned To</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="t" items="${tickets}" varStatus="s">
            <tr>
                <td>${s.index + 1}</td>
                <td>${t.customer.username}</td>
                <td>${t.title}</td>
                <td>${t.status}</td>
                <td>
                    <c:choose>
                        <c:when test="${t.assignedTo != null}">
                            ${t.assignedTo.username}
                        </c:when>
                        <c:otherwise>Not Assigned</c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<div class="center">
    <a href="/admin-dashboard" class="btn">Back</a>
</div>

</body>
</html>
