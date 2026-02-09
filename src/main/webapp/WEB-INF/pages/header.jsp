<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Ticket System</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav" aria-controls="navbarNav"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">

                <!-- Admin Menu -->
                <c:if test="${not empty sessionScope.user and sessionScope.user.role == 'admin'}">
                    <li class="nav-item">
                        <a class="nav-link" href="/admin-dashboard">Admin Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/staff-dashboard">Staff Dashboard</a>
                    </li>
                    
                </c:if>

                <!-- Staff Menu -->
                <c:if test="${not empty sessionScope.user and sessionScope.user.role == 'staff'}">
                    <li class="nav-item">
                        <a class="nav-link" href="/staff-dashboard">Staff Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/Customer-dashboard">Customer Dashboard</a>
                    </li>
                </c:if>

                <!-- Customer Menu -->
                <c:if test="${not empty sessionScope.user and sessionScope.user.role == 'user'}">
                    <li class="nav-item">
                        <a class="nav-link" href="/Customer-dashboard">Customer Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/register3">New Registration</a>
                    </li>
                </c:if>

            </ul>

            <!-- Right Side User Info -->
            <ul class="navbar-nav">
                <c:if test="${not empty sessionScope.user}">
                    <li class="nav-item">
                        <span class="navbar-text text-white me-3">
                            Logged in: ${sessionScope.user.username}
                        </span>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-danger btn-sm" href="/logout">Logout</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
