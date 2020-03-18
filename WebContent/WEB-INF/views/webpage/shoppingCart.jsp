<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping cart</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layouts/header.jsp" />

	<div class="container" style="padding: 30px;">
		<div class="card shopping-cart">
			<div class="card-header bg-dark text-light">
				<i class="fa fa-shopping-cart" aria-hidden="true"></i> Shopping cart
				<a href="home.htm" class="btn btn-outline-info btn-sm pull-right"
					style="color: #EEE;">Continue shopping</a>
				<div class="clearfix"></div>
			</div>
			<div class="card-body">
				<table id="cart" class="table table-hover table-condensed">
					<thead>
						<tr>
							<th style="width: 50%">Product</th>
							<th style="width: 10%">Price</th>
							<th style="width: 8%">Quantity</th>
							<th style="width: 22%" class="text-center">Subtotal</th>
							<th style="width: 10%"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${sessionScope.myCartItems}" var="map">
							<tr>
								<td data-th="Product">
									<div class="row">
										<div class="col-sm-4 hidden-xs">
											<img src="http://placehold.it/100x100" alt="..."
												class="img-responsive" />
										</div>
										<div class="col-sm-10">
											<h4 class="nomargin">${map.value.product.productName}</h4>
											<p>${map.value.product.productDescription}</p>
										</div>
									</div>
								</td>
								<td data-th="Price">${map.value.product.buyPrice}</td>
								<td data-th="Quantity"><input type="number" min="1" max="100"
									class="form-control text-center" id="inputQuantity"
									value="${map.value.quantity }"></td>
								<td data-th="Subtotal" class="text-center">
									${map.value.quantity }</td>
								<td class="actions" data-th="">
									<button class="btn btn-info btn-sm">
										<i class="fa fa-refresh"></i>
									</button> <a href="remove-${map.value.product.productId }.htm">
										<button class="btn btn-danger btn-sm">
											<i class="fa fa-trash-o"> </i>
										</button>
								</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<hr>
				<!-- END PRODUCT -->
				<!-- PRODUCT -->

				<!-- END PRODUCT -->
				<div class="pull-right">
					<a href="" class="btn btn-outline-secondary pull-right"> Update
						shopping cart </a>
				</div>
			</div>
			<div class="card-footer">

				<div class="pull-right" style="margin: 10px">
					<a href="checkout.htm" class="btn btn-success pull-right">Checkout</a>
					<div class="pull-right" style="margin: 5px">
						Total price: <b>${sessionScope.myCartTotal} VNĐ</b>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
	<script type="text/javascript">
		var onChange = function(evt) {
			console.info(this.value);
			// or
			console.info(evt.target.value);
		};
		var input = document.getElementById('inputQuantity');
		input.addEventListener('input', onChange, false);
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