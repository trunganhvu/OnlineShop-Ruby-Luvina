<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table products</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/layouts/header.jsp" />
	<div class="container11">
		<div class="main-body-content w-100 ets-pt">
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#exampleModal" data-whatever="@mdo" style="margin-bottom: 7px">Create new
				item</button>
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Create new
								category</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form:form action="addProduct.htm" modelAttribute="product">
							<div class="modal-body">
								<div class="form-group">
									<label for="recipient-name" class="col-form-label">Product
										Name:</label>
									<form:input path="productName" class="form-control"></form:input>
								</div>
								<div class="form-group">
									<label for="recipient-name" class="col-form-label">Product
										Line:</label>
									<!-- <form:input path="productLine" class="form-control"></form:input> -->
									<form:select path="productLine" class="form-control">
										<c:forEach items="${ProductLine}" var="line">
											<form:option value="${line.productLine}">${line.productLine}</form:option>
										</c:forEach>
									</form:select>
								</div>
								<div class="form-group">
									<label for="recipient-name" class="col-form-label">Description:</label>
									<form:input path="productDescription" class="form-control"></form:input>
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">Quantity:</label>
									<form:input path="quantityInStock" class="form-control" />
								</div>
								<div class="form-group">
									<label for="recipient-name" class="col-form-label">Price:</label>
									<form:input path="buyPrice" class="form-control"></form:input>
								</div>
							</div>
							<div class="modal-footer">
								<!--   <button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button> -->
								<input type="submit" class="btn btn-primary" value="save">
							</div>
						</form:form>
					</div>
				</div>
			</div>

			<div class="table-responsive bg-light">
				<table class="table">
					<tr>
						<th>Name</th>
						<th>Category</th>
						<th>Description</th>
						<th>Quantity</th>
						<th>Price</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
					<c:forEach items="${Product }" var="product">
						<tr>
							<td>${product.productName }</td>
							<td>${product.productLine }</td>
							<td>${product.productDescription }</td>
							<td>${product.quantityInStock }</td>
							<td>${product.buyPrice }</td>
							<td>
								<button type="button" class="btn btn-primary"
									data-toggle="modal"
									data-target="#exampleModal${product.productId }"
									data-whatever="@mdo">Edit</button>
								<div class="modal fade" id="exampleModal${product.productId }"
									tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Edit
													Product</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<form:form
												action="editProduct-${product.productId  }.htm"
												modelAttribute="product">
												<div class="modal-body">

													<div class="form-group">
														<label for="recipient-name" class="col-form-label">Product
															Name:</label>
														<form:input path="productName" class="form-control" value="${product.productName }"></form:input>
													</div>
													<div class="form-group">
														<label for="recipient-name" class="col-form-label">Product
															Line:</label>
														<form:select path="productLine" class="form-control">
															<c:forEach items="${ProductLine}" var="line">
																<form:option value="${line.productLine}">${line.productLine}</form:option>
															</c:forEach>
														</form:select>
													</div>
													<div class="form-group">
														<label for="recipient-name" class="col-form-label">Description:</label>
														<form:input path="productDescription" class="form-control" value="${product.productDescription }"></form:input>
													</div>
													<div class="form-group">
														<label for="message-text" class="col-form-label">Quantity:</label>
														<form:input path="quantityInStock" class="form-control" value="${product.quantityInStock }"/>
													</div>
													<div class="form-group">
														<label for="recipient-name" class="col-form-label">Price:</label>
														<form:input path="buyPrice" class="form-control" value="${product.buyPrice }"></form:input>
													</div>
												</div>
												<div class="modal-footer">
													<!--   <button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button> -->
													<input type="submit" class="btn btn-primary" value="save">
												</div>
											</form:form>
										</div>
									</div>
								</div>
							</td>
							<td><a href="removeProduct-${product.productId }.htm">delete</a></td>
						</tr>
					</c:forEach>

				</table>
			</div>
		</div>
	</div>
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