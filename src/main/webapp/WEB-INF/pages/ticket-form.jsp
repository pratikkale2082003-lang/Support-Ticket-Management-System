<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>Create Ticket</h3>
    <form action="/ticket/create" method="post">
        <div class="mb-2">
            <label>Title</label>
            <input type="text" name="title" class="form-control" required><br><br>
        </div>
        <div class="mb-2">
            <label>Description</label>
            <textarea name="description" class="form-control" required></textarea><br><br>
        </div>
        <button class="btn btn-success" type="submit">Create</button>
    </form>
</div>

</body>
</html>