<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table product line</title>
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
				data-target="#exampleModal" data-whatever="@mdo">Create new
				item</button>
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Create new category</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form:form action="addProductLine.htm" modelAttribute="productLine">
							<div class="modal-body">

								<div class="form-group">
									<label for="recipient-name" class="col-form-label">Category:</label>
									<form:input path="productLine" class="form-control"></form:input>
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">Description:</label>
									<form:input path="textDescription" class="form-control" />
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
						<th>Name<a href="formCreateProductLine.htm">link</a></th>
						<th>Description</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
					<c:forEach items="${ProductLine}" var="line">
						<tr>
							<td>${line.productLine }</td>
							<td>${line.textDescription }</td>
							<td>
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#exampleModal${line.productLineId }"
									data-whatever="@mdo">Edit</button>
								<div class="modal fade" id="exampleModal${line.productLineId }" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Edit Product Line</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<form:form action="editProductLine-${line.productLineId }.htm" modelAttribute="productLine">
												<div class="modal-body">

													<div class="form-group">
														<label for="recipient-name" class="col-form-label">Category:</label>
														<form:input path="productLine" class="form-control" value="${line.productLine }"></form:input>
													</div>
													<div class="form-group">
														<label for="message-text" class="col-form-label">Description:</label>
														<form:input path="textDescription" class="form-control" value="${line.textDescription }"/>
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
								</div></td>
							<td><a href="remove-${line.productLineId }.htm">delete</a></td>
						</tr>
					</c:forEach>

				</table>
			</div>
		</div>



	</div>

	<script type="text/javascript">
		
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