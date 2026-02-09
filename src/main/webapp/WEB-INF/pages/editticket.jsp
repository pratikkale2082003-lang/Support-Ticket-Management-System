<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Ticket</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 0;
    }
    .container {
        max-width: 700px;
        margin: 50px auto;
        padding: 0 15px;
    }
    .card {
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        overflow: hidden;
    }
    .card-header {
        background-color: #0d6efd;
        color: #fff;
        padding: 15px 20px;
        font-size: 18px;
        font-weight: bold;
    }
    .card-body {
        padding: 20px;
    }
    .form-label {
        display: block;
        margin-bottom: 5px;
        font-weight: 600;
    }
    .form-control, textarea {
        width: 100%;
        padding: 8px 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
        box-sizing: border-box;
    }
    .form-check {
        display: inline-block;
        margin-right: 15px;
    }
    .form-check input {
        margin-right: 5px;
    }
    .buttons {
        display: flex;
        justify-content: flex-end;
        gap: 10px;
    }
    .btn {
        padding: 8px 15px;
        border-radius: 5px;
        border: none;
        font-size: 14px;
        cursor: pointer;
    }
    .btn-success {
        background-color: #198754;
        color: #fff;
    }
    .btn-secondary {
        background-color: #6c757d;
        color: #fff;
        text-decoration: none;
        display: inline-block;
        line-height: 1.5;
    }
    .btn-success:hover {
        background-color: #157347;
    }
    .btn-secondary:hover {
        background-color: #5a6268;
    }
</style>
</head>
<body>
<div class="container">
    <div class="card">
        <div class="card-header">
            Edit Ticket
        </div>
        <div class="card-body">
            <form action="/update-ticket" method="post">
                <input type="hidden" name="id" value="${ticket.id}" />

               
<br>
                <!-- Ticket Title -->
                <div class="mb-3">
                    <label class="form-label">Title</label>
                    <input type="text" name="title" class="form-control" value="${ticket.title}" required />
                </div>

                <!-- Ticket Description -->
                <div class="mb-3">
                    <label class="form-label">Description</label>
                    <textarea name="description" class="form-control" rows="4" required>${ticket.description}</textarea>
                </div>

                <div class="buttons">
                    <button type="submit" class="btn btn-success">Update Ticket</button>
                    <a href="/admin-dashboard" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
