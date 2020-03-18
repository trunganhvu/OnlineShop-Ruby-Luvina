<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List product</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

</head>
<body>
	<jsp:include page="/WEB-INF/views/layouts/header.jsp" />

	<div class="container" style="padding: 30px;">
		<div class="row">
			<div class="col-lg-12 my-3">
				<div class="pull-right">
					<div class="btn-group">
						<button class="btn btn-info" id="list">List View</button>
						<button class="btn btn-danger" id="grid">Grid View</button>
					</div>
				</div>
			</div>
		</div>
		<div id="products" class="row view-group">
			<c:choose>
				<c:when test="${product.size() > 0 }">
					<c:forEach items="${product}" var="p">
						<div class="item col-xs-4 col-lg-4">
							<div class="thumbnail card">

								<div class="img-event">
									<img class="group list-group-image img-fluid"
										src="http://placehold.it/400x250/000/fff" alt="" />
								</div>
								<div class="caption card-body">
									<h4 class="group card-title inner list-group-item-heading">
										<a href="productdetail${p.productId }.htm">${p.productName}</a>
									</h4>
									<p class="group inner list-group-item-text">${p.productDescription}</p>
									<div class="row">
										<div class="col-xs-12 col-md-6">
											<p class="lead">$ ${p.buyPrice}</p>
										</div>
										<div class="col-xs-12 col-md-6">
											<a class="btn btn-success" href="#">Add to cart</a>
										</div>
									</div>
								</div>

							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<h1 style="font-size: 50px">Hiện chưa có sản phẩm nào!!!</h1>
					<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
				</c:otherwise>
			</c:choose>
		</div>
	</div>



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