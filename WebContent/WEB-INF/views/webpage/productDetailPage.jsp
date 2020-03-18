<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Detail</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<style type="text/css">
.gallery-wrap .img-big-wrap img {
	height: 450px;
	width: auto;
	display: inline-block;
	cursor: zoom-in;
}

.gallery-wrap .img-small-wrap .item-gallery {
	width: 60px;
	height: 60px;
	border: 1px solid #ddd;
	margin: 7px 2px;
	display: inline-block;
	overflow: hidden;
}

.gallery-wrap .img-small-wrap {
	text-align: center;
}

.gallery-wrap .img-small-wrap img {
	max-width: 100%;
	max-height: 100%;
	object-fit: cover;
	border-radius: 4px;
	cursor: zoom-in;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
	
	<div class="container" style="padding: 30px;">
		<c:forEach items="${list }" var="l">	
		
		<div class="card">
			<div class="row">
				<aside class="col-sm-5 border-right">
					<article class="gallery-wrap">
						<div class="img-big-wrap">
							<div>
								<a href="#"><img
									src="http://placehold.it/250x250/000/fff"></a>
							</div>
						</div>
						<!-- slider-product.// -->
						<div class="img-small-wrap">
							<div class="item-gallery">
								<img src="http://placehold.it/250x250/000/fff">
							</div>
							<div class="item-gallery">
								<img src="http://placehold.it/250x250/000/fff">
							</div>
							<div class="item-gallery">
								<img src="http://placehold.it/250x250/000/fff">
							</div>
							<div class="item-gallery">
								<img src="http://placehold.it/250x250/000/fff">
							</div>
						</div>
						<!-- slider-nav.// -->
					</article>
					<!-- gallery-wrap .end// -->
				</aside>
				<aside class="col-sm-7">
					<article class="card-body p-5">
						<h3 class="title mb-3">${l.productName }</h3>

						<p class="price-detail-wrap">
							<span class="price h3 text-warning"> <span
								class="currency">US $</span><span class="num">${l.buyPrice }</span>
							</span> 
						</p>
						<!-- price-detail-wrap .// -->
						<dl class="item-property">
							<dt>Description</dt>
							<dd>
								<p>${l.productDescription }</p>
							</dd>
						</dl>
						<dl class="param param-feature">
							<dt>Model#</dt>
							<dd>12345611</dd>
						</dl>

						<hr>
						<div class="row">
							<!-- <div class="col-sm-5">
								<dl class="param param-inline">
									<dt>Quantity:</dt>
									<dd>
										<select id="select-quantity" class="form-control form-control-sm"
											style="width: 70px;">
											<option>9</option>
											<option>2</option>
											<option>3</option>
										</select>
									</dd>
								</dl>
							</div>
							 -->
							<div class="col-sm-5">
								<dl class="param param-inline">
									<dt>Quantity:</dt>
									<dd>
										<input type="number" id="select-quantity1" min="0" max="100">
									</dd>
								</dl>
							</div>
							<div class="col-sm-5">
								<dl class="param param-inline">
									<dt>Status:</dt>
									<dd>
										<c:choose>
											<c:when test="${l.quantityInStock <=0 }"> Hết hàng</c:when>
											<c:otherwise>Còn hàng</c:otherwise>
										</c:choose>
									</dd>
								</dl>
								<!-- item-property .// -->
							</div>
						</div>
						<!-- row.// -->
						<hr>
						<!--  <a href="#" class="btn btn-lg btn-primary text-uppercase"> Buy
							now </a>  --> 
							<a href="add-${l.productId }.htm" class="btn btn-lg btn-outline-primary text-uppercase"> Add to cart
						</a>
					</article>
					<!-- card-body.// -->
				</aside>
				<!-- col.// -->
			</div>
			<!-- row.// -->
		</div>
		<!-- card.// -->

	</c:forEach>
	</div>
	<!--container.//-->


	

	<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
	<script type="text/javascript">
		var quantity = document.getElementById("select-quantity1").value;
		console.log(quantity);
	</script>
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