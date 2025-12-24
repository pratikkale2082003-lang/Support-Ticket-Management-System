<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<%@ include file="header.jsp" %>
    <title>Staff Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-4">

    <h2>Staff Dashboard</h2>
    <hr>

    <!-- SHOW ASSIGN SECTION IF ADMIN CLICKED ASSIGN -->
    <c:if test="${not empty ticket}">
        <div class="card shadow p-4 mb-4">
            <h4 class="mb-3">Assign Ticket: ${ticket.title}</h4>

            <form action="/assignTicket" method="post">

                <input type="hidden" name="ticketId" value="${ticket.id}">

                <div class="mb-3">
                    <label class="form-label">Select Staff:</label>
                    <select name="staffId" class="form-control" required>
                        <c:forEach var="s" items="${staffList}">
                            <option value="${s.id}">${s.username}</option>
                        </c:forEach>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">Assign Ticket</button>
                <a href="/admin-dashboard" class="btn btn-secondary">Cancel</a>

            </form>
        </div>
    </c:if>

    <!-- NORMAL STAFF DASHBOARD CONTENT -->
    <c:if test="${empty ticket}">
        <h4>Your Assigned Tickets</h4>

        <table class="table table-bordered mt-3">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Customer</th>
                <th>Title</th>
                <th>Status</th>
                <th>Update Status</th>
                <th>View</th>
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
                        <form action="/updateTicketStatus" method="post" class="d-flex gap-2">
                            <input type="hidden" name="ticketId" value="${t.id}">
                            <select name="status" class="form-control form-select-sm" required>
                                <option value="in_process" ${t.status == 'in_process' ? 'selected' : ''}>In Process</option>
                                <option value="closed" ${t.status == 'closed' ? 'selected' : ''}>Closed</option>
                            </select>
                            <button type="submit" class="btn btn-success btn-sm">Update</button>
                        </form>
                    </td>
                    <td><a href="/ticket/${t.id}" class="btn btn-info btn-sm">Open</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>

</div>

</body>
</html>
