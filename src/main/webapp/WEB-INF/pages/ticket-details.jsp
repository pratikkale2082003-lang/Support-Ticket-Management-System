<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ticket Details</title>


    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Segoe UI', sans-serif;
        }

        .ticket-box {
            margin-top: 40px;
            background: #ffffff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h2, h3 {
            font-weight: 600;
            color: #333;
        }

        .detail-label {
            font-weight: bold;
            color: #444;
        }

        .remark-box {
            background: #f8f9fa;
            border-left: 4px solid #0d6efd;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 12px;
            transition: 0.3s;
        }

        .remark-box:hover {
            background: #eef2f7;
        }

        textarea {
            border-radius: 10px;
        }

        .btn-primary {
            padding: 7px 18px;
            border-radius: 20px;
            font-weight: 500;
        }
    </style>
</head>

<body>

<div class="container ticket-box">
    <h2>Ticket Details</h2>
    <hr>

    <p><span class="detail-label">ID:</span> ${ticket.id}</p>
    <p><span class="detail-label">Title:</span> ${ticket.title}</p>
    <p><span class="detail-label">Description:</span> ${ticket.description}</p>
    <p><span class="detail-label">Status:</span> ${ticket.status}</p>
    <p><span class="detail-label">Created By:</span> ${ticket.customer.username}</p>

    <h3 class="mt-4">Remarks</h3>
    <hr>

    <c:forEach items="${ticket.remarks}" var="r">
        <div class="remark-box">
            <p>${r.remark}</p>
            <p><small class="text-muted">${r.createdAt}</small></p>
        </div>
    </c:forEach>

    <c:if test="${sessionScope.user.role != 'user'}">
        <h4 class="mt-4">Add Remark</h4>
        <form method="post" action="/ticket/${ticket.id}/remark">
            <textarea name="remark" class="form-control mb-3" rows="3" required></textarea>
            <button type="submit" class="btn btn-primary">Add Remark</button>
        </form>
    </c:if>
</div>

</body>
</html>
