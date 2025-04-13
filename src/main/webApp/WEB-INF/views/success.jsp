<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.example.JobApp_2.model.Job" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Job Post Details</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous">

    <style>
        body {
            background-color: #0e0e10;
            color: #ffffff;
        }
        .card {
            background-color: #1a1a2e;
            border: 2px solid #6f42c1;
            color: white;
            margin-bottom: 20px;
            box-shadow: 0px 0px 15px #6f42c1;
        }
        .navbar {
            background-color: #6f42c1 !important;
        }
        .navbar-brand, .nav-link {
            color: white !important;
        }
        .nav-link:hover {
            text-decoration: underline;
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
                <li class="nav-item">
                    <a class="nav-link" href="home">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="viewalljobs">All Jobs</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <h2 class="mb-4 text-center fw-bold">Job Post Details</h2>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card p-4">
                <div class="card-body">
                    <%
                        Job myJobPost = (Job) request.getAttribute("jobPost");
                        if (myJobPost != null) {
                    %>
                    <h5 class="card-title fs-3"><%= myJobPost.getPostProfile() %></h5>
                    <p class="card-text"><strong>Description:</strong> <%= myJobPost.getPostDesc() %></p>
                    <p class="card-text"><strong>Experience Required:</strong> <%= myJobPost.getReqExperience() %> years</p>
                    <p class="card-text"><strong>Tech Stack:</strong></p>
                    <ul>
                        <% for (String tech : myJobPost.getPostTechStack()) { %>
                        <li><%= tech %></li>
                        <% } %>
                    </ul>
                    <%
                        } else {
                    %>
                    <p class="text-danger">No job details available.</p>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>
