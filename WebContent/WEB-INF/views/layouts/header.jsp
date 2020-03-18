<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div style="background-color: #007b5e">
		<ul class="nav justify-content-end">
			<li class="nav-item"><a class="nav-link" style="color: #EEE"
				href="login.htm">Login</a></li>
			<li class="nav-item"><a class="nav-link" style="color: #EEE"
				href="register.htm">Register</a></li>
		</ul>
	</div>
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">

			<a class="navbar-brand font-weight-bold text-uppercase"
				href="home.htm" style="font-size: 32px; color: #0aa681">Online Shop</a>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="home.htm">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="shoppingcart.htm">Cart</a></li>
					<li class="nav-item"><a class="nav-link" href="listproduct-page1.htm">Product</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Category product </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Something else here</a>
						</div></li>

					</li>

				</ul>
				<form class="form-inline my-2 my-lg-0" action="search" method="get">
					<input class="form-control mr-sm-2" type="text" name="word"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				</form>
				
			</div>
		</nav>
	</header>


</body>
</html>