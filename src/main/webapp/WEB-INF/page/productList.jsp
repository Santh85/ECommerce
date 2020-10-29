<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!-- 	navigation Bar -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Management</title>
<link rel="icon" type="image/x-icon"
	href="<c:url value="/resource/images/favicon1.png"/>" />
<link rel="stylesheet"
	href="<c:url value="../resource/bootstrap/css/bootstrap.min.css"/>">
<script src="<c:url value="../resource/js/jquery.js"/>"></script>
<script src="<c:url value="../resource/bootstrap/js/bootstrap.min.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="../resource/css/ProductList.css"/>">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="<c:url value="../resource/js/productController.js"/>"></script>
</head>
<body ng-app="myapp">
	<div class="container" id="productTable"
		style="width: 1145px; margin-bottom: 180px;">
		<h2>Product Access</h2>
		<p>The List of Products </p>
		<table class="table table-hover" id="productList">
			<thead>
				<tr>
					<th>Product Id</th>
					<th>Product Name</th>
					<th>Products Price</th>
				</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${products}" var="prod">
					<tr>
						<td style="width: 171px"><img
							src="<c:url value="/resource/images/products/${prod.productId}.jpg"/>"
							style="width: 100px; height: 90px;" ${prod.productName}"  /></td>
						<td>${prod.productId}</td>
						<td>${prod.productName}</td>
						<td>${prod.productPrice}</td>
						
						<td ng-controller="myController"><a
							href="getProductById/${prod.productId}" class="btn btn-info"
							role="button"> <span class="glyphicon glyphicon-info-sign"></span></a>
								 access="hasAnyRole('ROLE_USER')">
								<a href="#" ng-click="addToCart(${prod.productId})"
									class="btn btn-primary" style="margin-left: 5px"> <span
									class="glyphicon glyphicon-shopping-cart"></span></a>
							
								access="hasAnyRole('ROLE_ADMIN')">
								<a href="admin/product/editProduct/${prod.productId}"
									class="btn btn-success" style="margin-left: 5px"> <span
									class="glyphicon glyphicon-edit"></span></a>
								<a href="admin/delete/${prod.productId}" class="btn btn-danger"
									style="margin-left: 5px"> <span
									class="glyphicon glyphicon-trash"></span></a>
							</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
