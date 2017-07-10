<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Catalogo de produtos</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
</head>
<body>

	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="user"/>
		<div>
			Olá ${user.name}
		</div>	
	</sec:authorize>

	<ul class="menu">
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<li><a href="${spring:mvcUrl('PC#form').build()}">Cadastrar novo produto</a></li>
		</sec:authorize>
	</ul>

	<table>
		<tr>
			<td>Titulo</td>
			<td>Valores</td>
		</tr>
		<c:forEach items="${products}" var="product">
			<tr>
				<td><a href="${spring:mvcUrl('PC#show').arg(0,product.id).build()}">${product.title}</a></td>
				<td>
					<c:forEach items="${product.prices}" var="price">
						[${price.value} - ${price.bookType}]
					</c:forEach>
				</td>
			</tr>
		</c:forEach>
</table>
</body>
</html>