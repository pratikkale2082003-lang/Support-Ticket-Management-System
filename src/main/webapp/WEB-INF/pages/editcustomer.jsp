<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Customer</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h4>Edit Customer</h4>
        </div>

        <div class="card-body">
            <form action="/update-customer" method="post">
                <!-- Hidden ID -->
                <input type="hidden" name="id" value="${customer.id}" />

                <!-- Username -->
                <div class="mb-3">
                    <label class="form-label">Username</label>
                    <input type="text"
                           class="form-control"
                           name="username"
                           value="${customer.username}"
                           required />
                </div>

                <!-- Password -->
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password"
                           class="form-control"
                           name="password"
                           value="${customer.password}"
                           required />
                </div>

                <!-- Role -->
                <div class="mb-3">
                    <label class="form-label">Role</label>
                    <select name="role" class="form-select">
                        <option value="user" ${customer.role == 'user' ? 'selected' : ''}>User</option>
                        <option value="staff" ${customer.role == 'staff' ? 'selected' : ''}>Staff</option>
                     
                    </select>
                    </div>
                <!-- Active / Deactive -->
                <div class="mb-3">
                    <label class="form-label">Status</label><br>

                    <div class="form-check form-check-inline">
                        <input class="form-check-input"
                               type="radio"
                               name="active"
                               value="true"
                               ${customer.active ? 'checked' : ''}>
                        <label class="form-check-label">Active</label>
                    </div>

                    <div class="form-check form-check-inline">
                        <input class="form-check-input"
                               type="radio"
                               name="active"
                               value="false"
                               ${!customer.active ? 'checked' : ''}>
                        <label class="form-check-label">Deactive</label>
                    </div>
                </div>

                <!-- Buttons -->
                <div class="d-flex gap-2">
                    <button type="submit" class="btn btn-success">Update Customer</button>
                    <a href="/admin-dashboard" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
