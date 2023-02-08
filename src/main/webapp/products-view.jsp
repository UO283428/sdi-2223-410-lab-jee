<%--
  Created by IntelliJ IDEA.
  User: uo283428
  Date: 08/02/2023
  Time: 13:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.uniovi.sdi.*,java.util.List" %>
<html>
<head>
    <title>Store Products</title>
</head>
<body>
<div class="container" id="main-container">
    <h2>Store Products</h2>
    <c:forEach var="product" items="${storeProducts}">
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
            <div>
                <img src="<c:out value="${product.image}"/>"/>
                <div><c:out value="${product.name}"/></div>
                    <c:out value="${product.price}"/> €
            </div>
        </div>
    </c:forEach>
    <a href="index.jsp">Volver</a>
</div>
</body>
</html>
