<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html lang="en">
<head>
    <title>Comment section</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<c:if test="${sessionScope.user != 'admin' && sessionScope.user != 'admin1'}">
    <c:redirect url="/login.jsp"/>
</c:if>
<jsp:useBean id="comment" class="com.uniovi.sdi.Comment"/>
<jsp:setProperty name="comment" property="*"/>

<c:if test="${comment.name != null}">
    <jsp:useBean id="commentService" class="com.uniovi.sdi.CommentService"/>
    <jsp:setProperty name="commentService" property="newComment" value="${comment}"/>
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
    <h2>Agregar un comentario</h2>
    <form class="form-horizontal" method="post" action="comment.jsp">
        <div class="form-group">
            <label class="control-label col-sm-2" for="name">Nombre:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="name" name="name" value="${sessionScope.user}" disabled/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="image">Comentario:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="image" name="image" required="true"/>
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
    <h2>Comentarios</h2>
    <c:forEach var="c" items="${theComments}">
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
            <div><c:out value="${c.name}"/></div>
            <div><c:out value="${c.comment}"/></div>
            <div><c:out value="${c.date}"/></div>
        </div>
    </c:forEach>
</div>
</body>
</html>