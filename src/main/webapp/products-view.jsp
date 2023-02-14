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
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
<jsp:useBean id="counter" class="com.uniovi.sdi.Counter" scope="application"/>
<jsp:setProperty name="counter" property="increase" value="1"/>
<!-- Barra de Navegación superior -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <ul class="nav navbar-nav">
            <li class="nav-item"><a class="nav-link" href="AddToShoppingCart">Carrito</a></li>
            <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
            <li class="nav-item"><a class="nav-link" href="admin.jsp">Administrar productos</a></li>
            <li class="nav-item"><a class="nav-link" href="products">Ver productos</a></li>
            <li class="nav-item"><a class="nav-link" href="comment.jsp">Ver comentarios</a></li>
        </ul>
        <div class="nav navbar-right">
            <div class="center-block">
                <jsp:getProperty name="counter" property="total"/>
                Visitas
            </div>
        </div>
    </div>
</nav>
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