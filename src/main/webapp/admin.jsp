<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html lang="en">
<head>
    <title>Servlets</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%-- Cambiado por las etiquetas JSTL
<%
 String user = (String) request.getSession().getAttribute("user");
 System.out.println("Usuario en sesión: " + user);
 if (user == null || user.equals("admin") == false) {
 // No hay usuario o no es admin
 response.sendRedirect("login.jsp");
 }
%>
--%>
<c:if test="${sessionScope.user != 'admin' && sessionScope.user != 'admin1'}">
    <c:redirect url="/login.jsp"/>
</c:if>
<jsp:useBean id="product" class="com.uniovi.sdi.Product"/>
<jsp:setProperty name="product" property="*"/>
<%-- Cambiado por las etiquetas JSTL
<%
 if (product.getName() != null) {
 new ProductsService().setNewProduct(product);
 request.getRequestDispatcher("index.jsp").forward(request, response);
 }
%>
--%>
<c:if test="${product.name != null}">
    <jsp:useBean id="productsService" class="com.uniovi.sdi.ProductsService"/>
    <jsp:setProperty name="productsService" property="newProduct" value="${product}"/>
    <c:redirect url="/index.jsp"/>
</c:if>
<jsp:useBean id="counter" class="com.uniovi.sdi.Counter" scope="application"/>
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
<!-- Contenido -->
<div class="container" id="main-container">
    <h2>Agregar producto a la tienda</h2>
    <form class="form-horizontal" method="post" action="admin.jsp">
        <div class="form-group">
            <label class="control-label col-sm-2" for="name">Nombre:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="name" name="name" required="true"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="image">URL imagen:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="image" name="image" required="true"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="price">Precio (€):</label>
            <div class="col-sm-10">
                <input type="number" step="0.01" class="form-control" id="price" name="price"
                       required="true"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">Agregar</button>
            </div>
        </div>
    </form>
</div>
<div class="container" id="contenedor-principal">
    <h2>Administrar</h2>
</div>
</body>
</html>