<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<html>
<head>

<title>Admin</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
</head>
<style>
body
{
background-color:#cccccc;
}
</style>

<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="Category">Category</a></li>
      <li><a href="Product">Product</a></li> 
      <li><a href="Supplier">Supplier</a></li> 
    </ul>
  </div>
</nav>
${msg }
<c:choose>
<c:when test="${userclickedSupplier }">
<c:import url="/WEB-INF/views/Supplier.jsp"/>
</c:when>
</c:choose>
<c:choose>
<c:when test="${userclickedProduct }">
<c:import url="/WEB-INF/views/Product.jsp"/>
</c:when>
</c:choose>
<c:choose>
<c:when test="${userclickedCategory }">
<c:import url="/WEB-INF/views/Category.jsp"/>
</c:when>
</c:choose>

</body>

</html>  