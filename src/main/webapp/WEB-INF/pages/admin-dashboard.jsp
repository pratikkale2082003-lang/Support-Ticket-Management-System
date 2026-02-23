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

    <!-- 🔎 Search Form -->
    <form method="get" action="/admin-dashboard" class="mb-3">
        <div class="row">
            <div class="col-md-4">
                <input type="text" name="keyword" class="form-control"
                       placeholder="Search Customer..."
                       value="${param.keyword}">
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-primary btn-sm">
                    Search
                </button>
            </div>
        </div>
    </form>

    <div class="mb-3">
        <a href="/reportdaily" class="btn btn-success btn-sm">Daily Report</a>
        <a href="/reportmonthly" class="btn btn-primary btn-sm">Monthly Report</a>
    </div>

    <!-- 🗑️ Multiple Delete Form -->
    <form method="post" action="/deleteSelectedCustomers">

        <table class="table table-striped table-bordered mt-3">
            <thead class="table-dark">
                <tr>
                    <th>
                        <input type="checkbox" id="selectAll">
                    </th>
                    <th>ID</th>
                    <th>Customer</th>
                    <th>Title</th>
                    <th>Status</th>
                    <th>Assign</th>
                    <th>View</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
            <c:forEach var="t" items="${tickets}" varStatus="status">
                <tr>
                    <td>
                        <input type="checkbox" name="customerIds"
                               value="${t.customer.id}">
                    </td>
                    <td>${status.index + 1}</td>
                    <td>${t.customer.username}</td>
                    <td>${t.title}</td>
                    <td>${t.status}</td>
                    <td>
                        <a href="/assignTicket?ticketId=${t.id}"
                           class="btn btn-warning btn-sm">Assign</a>
                    </td>
                    <td>
                        <a href="/ticket/${t.id}"
                           class="btn btn-info btn-sm">Open</a>
                    </td>
                    <td>
                    
                        <a href="/editTicket/${t.id}"
                           class="btn btn-success btn-sm">Edit Ticket</a>
                           <a href="/editCustomer/${t.customer.id}"
   class="btn btn-primary btn-sm">New Staff/Ac & Dc</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <button type="submit" class="btn btn-danger btn-sm"
                onclick="return confirm('Delete Selected Customers?')">
                Delete Selected
        </button>
    </form>

</div>

<!-- ✅ Select All Script -->
<script>
document.getElementById("selectAll").addEventListener("click", function() {
    let checkboxes = document.querySelectorAll("input[name='customerIds']");
    checkboxes.forEach(cb => cb.checked = this.checked);
});
</script>

</body>
</html>
