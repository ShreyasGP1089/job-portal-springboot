🧑‍💼 Job Portal Web Application
This is a full-stack web application built with Spring Boot that allows users to manage job postings. The application demonstrates clean architectural practices using the three-layer architecture: Controller, Service, and Repository. It also includes Spring Security for authentication, Spring AOP for cross-cutting concerns, and integrates JPA with PostgreSQL for data persistence.

🔧 Tech Stack:
Backend: Java, Spring Boot, Spring MVC, Spring Data JPA, Spring AOP, Spring Security

Frontend: HTML, CSS (custom + Bootstrap 5)

Database: PostgreSQL

🔐 Security:
HTTP Basic Authentication using Spring Security

Custom UserDetailsService and UserPrincipal implementation

Passwords stored securely using BCrypt hashing

Stateless session management (can be enabled)

User credentials verified from the PostgreSQL database

💡 Features:
Add, view, update, and delete job postings

Search job listings based on profile or description

User registration endpoint via POST request (can be tested with Postman)

Responsive UI using Bootstrap with a dark-themed layout

Cleanly separated layers for better maintainability

Use of AOP for logging and other concerns (if implemented)

Secure login authentication with password hashing

