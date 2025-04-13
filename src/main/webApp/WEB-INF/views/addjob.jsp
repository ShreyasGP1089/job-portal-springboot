<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Add Job Portal</title>

	<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom Font & Icons -->
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">

	<style>
		body {
			background-color: #0d0d0d;
			color: #f1f1f1;
			font-family: 'Inter', sans-serif;
		}

		.navbar {
			background-color: #5b21b6;
		}

		.navbar-brand, .nav-link {
			color: #fff !important;
			font-weight: 600;
		}

		.card {
			background-color: #1c1c1e;
			border: none;
			box-shadow: 0 0 15px rgba(128, 90, 213, 0.3);
			border-radius: 20px;
		}

		.form-label {
			font-weight: 500;
			color: #d1d5db;
		}

		.form-control, .form-select {
			background-color: #2a2a2e;
			border: 1px solid #6b7280;
			color: #f1f1f1;
		}

		.form-control:focus, .form-select:focus {
			border-color: #8b5cf6;
			box-shadow: 0 0 0 0.2rem rgba(139, 92, 246, 0.25);
		}

		.btn-primary {
			background-color: #8b5cf6;
			border: none;
			font-weight: 600;
			transition: background-color 0.3s ease;
		}

		.btn-primary:hover {
			background-color: #7c3aed;
		}
	</style>
</head>
<body>

<nav class="navbar navbar-expand-lg">
	<div class="container">
		<a class="navbar-brand fs-3" href="#">Job Portal</a>
		<button class="navbar-toggler bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ms-auto">
				<li class="nav-item"><a class="nav-link" href="home">Home</a></li>
				<li class="nav-item">
					<form action="viewalljobs" method="get" class="d-inline">
						<button type="submit" class="btn btn-link nav-link">All Jobs</button>
					</form>
				</li>

			</ul>
		</div>
	</div>
</nav>

<div class="container mt-5">
	<div class="row justify-content-center">
		<div class="col-lg-8">
			<div class="card p-4">
				<h2 class="mb-3 text-center fs-3 font-weight-bold text-white">Post a new Job</h2>

				<form action="handleForm" method="post">
					<div class="mb-3">
						<label for="postId" class="form-label">Post ID</label>
						<input type="text" class="form-control" id="postId" name="postId" required>
					</div>

					<div class="mb-3">
						<label for="postProfile" class="form-label">Post Profile</label>
						<input type="text" class="form-control" id="postProfile" name="postProfile" required>
					</div>

					<div class="mb-3">
						<label for="postDesc" class="form-label">Post Description</label>
						<textarea class="form-control" id="postDesc" name="postDesc" rows="3" required></textarea>
					</div>

					<div class="mb-3">
						<label for="reqExperience" class="form-label">Required Experience (Years)</label>
						<input type="number" class="form-control" id="reqExperience" name="reqExperience" required>
					</div>

					<div class="mb-3">
						<label for="postTechStack" class="form-label">Tech Stack</label>
						<select multiple class="form-select" id="postTechStack" name="postTechStack" required>
							<option value="Java">Java</option>
							<option value="JavaScript">JavaScript</option>
							<option value="Python">Python</option>
							<option value="Spring Boot">Spring Boot</option>
							<option value="React">React</option>
							<option value="Node.js">Node.js</option>
							<option value="Docker">Docker</option>
							<option value="AWS">AWS</option>
							<option value="Kubernetes">Kubernetes</option>
							<option value="Machine Learning">Machine Learning</option>
						</select>
						<small class="text-secondary">Hold Ctrl (or Cmd on Mac) to select multiple</small>
					</div>

					<div class="text-center">
						<button type="submit" class="btn btn-primary px-4">Submit Job</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
