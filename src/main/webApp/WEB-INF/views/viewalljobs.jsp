<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Post List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" />
    <style>
        body {
            background-color: #121212;
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .navbar {
            background-color: #6c4ab6;
        }

        .navbar-brand,
        .nav-link {
            color: white !important;
        }

        .nav-link:hover {
            color: #c8a2ff !important;
        }

        .card {
            background-color: #1f1f1f;
            border: 1px solid #6c4ab6;
            border-radius: 1rem;
            transition: transform 0.3s ease;
            position: relative;
        }

        .card:hover {
            transform: scale(1.03);
            box-shadow: 0 0 15px #6c4ab6;
        }

        .card-title,
        .card-text strong {
            color: #c8a2ff;
        }

        .card-text, ul li {
            color: white !important;
        }

        h2 {
            color: #c8a2ff;
            font-weight: bold;
        }

        .empty-message {
            color: #ccc;
            font-size: 1.25rem;
            text-align: center;
            margin-top: 20px;
        }

        .btn {
            border-radius: 0.5rem;
        }

        .btn-delete {
            position: absolute;
            bottom: 10px;
            left: 10px;
            background-color: #510b9b;
            border: none;
            color: white;
            font-size: 0.9rem;
            padding: 0.5rem;
            width: 35px;
            height: 35px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 10px;
            transition: background-color 0.3s;
        }

        .btn-delete:hover {
            background-color: #dc052c;
        }

        .btn-update {
            position: absolute;
            bottom: 10px;
            right: 10px;
            background-color: #510b9b;
            border: none;
            color: white;
            font-size: 0.9rem;
            padding: 0.5rem;
            width: 35px;
            height: 35px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 10px;
            transition: background-color 0.3s;
        }

        .btn-update:hover {
            background-color: #ec971f;
        }

        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
            font-size: 24px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand fs-1 fw-medium" href="#">Job Portal Web App</a>
        <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/viewalljobs">All Jobs</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/addjob">Add Job</a></li>

            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <h2 class="mb-4 text-center">
        <c:choose>
            <c:when test="${empty jobPosts}">
                No Jobs Added
            </c:when>
            <c:otherwise>
                Available Job Listings
            </c:otherwise>
        </c:choose>
    </h2>

    <!-- Search Bar -->
    <form action="${pageContext.request.contextPath}/viewalljobs/search" method="get" class="mb-4 d-flex justify-content-center">
        <input type="text" name="keyword" class="form-control w-50 me-2" placeholder="Search by profile or description..." />
        <button type="submit" class="btn btn-outline-light">Search</button>
    </form>

    <c:if test="${not empty searchWarning}">
         <div class="alert alert-warning text-center">${searchWarning}</div>
     </c:if>

     <c:if test="${empty jobPosts and empty searchWarning}">
         <div class="empty-message">No job posts available.</div>
     </c:if>


    <div class="row row-cols-1 row-cols-md-2 g-4">
        <c:forEach var="jobPost" items="${jobPosts}">
            <div class="col">
                <div class="card h-100">
                    <div class="card-body">
                        <h5 class="card-title text-white">${jobPost.postProfile}</h5>
                        <p class="card-text">
                            <strong>Id:</strong>
                            <span class="text-white">${jobPost.postId}</span>
                        </p>
                        <p class="card-text">
                            <strong>Description:</strong>
                            <span class="text-white">${jobPost.postDesc}</span>
                        </p>
                        <p class="card-text">
                            <strong>Experience Required:</strong>
                            <span class="text-white">${jobPost.reqExperience} years</span>
                        </p>
                        <p class="card-text">
                            <strong>Tech Stack:</strong>
                            <ul>
                                <c:forEach var="tech" items="${jobPost.postTechStack}">
                                    <li class="text-white">${tech}</li>
                                </c:forEach>
                            </ul>
                        </p>
                    </div>
                    <div class="card-footer bg-transparent border-0"></div>

                    <a href="${pageContext.request.contextPath}/viewall/del/${jobPost.postId}" class="btn btn-delete">
                        <span class="material-symbols-outlined">delete</span>
                    </a>

                    <a href="${pageContext.request.contextPath}/addjob?postId=${jobPost.postId}" class="btn btn-update">
                        <span class="material-symbols-outlined">edit</span>
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
