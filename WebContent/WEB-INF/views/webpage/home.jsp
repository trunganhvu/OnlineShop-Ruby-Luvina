<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<style type="text/css">
body {
	font-family: 'Montserrat', sans-serif;
	color: #333;
	line-height: 1.6;
}

.pt-100 {
	padding-top: 100px;
}

.pb-100 {
	padding-top: 100px;
}

.mb-60 {
	margin-bottom: 60px;
}

.section-title p {
	font-size: 24px;
	font-family: Oleo Script;
	margin-bottom: 0px;
	margin-top: 50px;
}

.section-title h4 {
	font-size: 40px;
	text-transform: capitalize;
	color: #FF5E18;
	position: relative;
	display: inline-block;
	padding-bottom: 25px;
}

.section-title h4::before {
	width: 80px;
	height: 1.5px;
	bottom: 0;
	left: 50%;
	margin-left: -40px;
}

.section-title h4::before, .section-title h4::after {
	position: absolute;
	content: "";
	background-color: #FF5E18;
}

.single_menu_list img {
	max-width: 60%;
	position: absolute;
	left: 0px;
	top: 0;
	border: 1px solid #ddd;
	padding: 3px;
	border-radius: 50%;
	transition: .4s;
}

.menu_style1 .single_menu_list img {
	position: static;
	width: 100%;
	display: block;
	margin: 0 auto;
	margin-bottom: 45px;
}

.single_menu_list h4 {
	font-size: 20px;
	border-bottom: 1px dashed #333;
	padding-bottom: 15px;
	margin-bottom: 10px;
}

.single_menu_list h4 span {
	float: right;
	font-weight: bold;
	color: #FF5E18;
	font-style: italic;
}

p {
	font-weight: 300;
	font-size: 14px;
}

.menu_style1 .single_menu_list {
	text-align: center;
}

.single_menu_list:hover img {
	border-radius: 0;
	transition: .4s;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layouts/header.jsp" />

	<section class="about-area pt-60">
		<div class="container">
			<div class="row">
				<div class="col-xl-12 mb-60">
					<div class="section-title text-center">
						<p>Category Product</p>
						<h4>menu</h4>
					</div>
				</div>
			</div>
			<div class="row menu_style1">
				<c:forEach items="${list}" var="l">
					<div class="col-md-4">
						<a href="products-${l.productLine}.htm">
							<div class="single_menu_list">
								<img
									src="https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/news/2020/05_03_miura/miura_news_cover_M.png"
									alt="">
								<div class="menu_content">
									<h4>${l.productLine}</h4>
									<p>${l.textDescription}</p>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>


			</div>
	</section>

	<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
</body>
</html>