<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html lang="en-US">

<head><title>Admin</title>

  <script src="${pageContext.request.contextPath}/app-resources/js/lib/jquery-2.2.3.min.js"></script>
  <script src="${pageContext.request.contextPath}/app-resources/js/myapp.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-resources/css/style.css"/>
 

</head>

<body>
<c:url var="addAction" value="addProduct" ></c:url> <!-- //jstl tag available in core tag library// -->
<form:form action="${addAction}" modelAttribute="product" id="btn-add" enctype="multipart/form-data"><!-- wen ever we click botton it should perform some Action -->
 <h3>
 <c:if test="$(product.id==0}">
 Add New Product
 </c:if>
 <c:if test="${!empty product.id}">
 Update Product for Id: <c:out value="${product.id}"/>
<form:hidden path="id"/>
 </c:if>
  </h3>
   <table>
<tr>  
<c:if test="${product.id!=0}">
 <td> Id:</td> <td><form:input  path="id"/></td> 
 </c:if>
<tr> <td> Name:</td> <td><form:input  path="name"/></td> 
<tr> <td>Description:</td> <td><form:input path="description"/> </td> 
<tr> <td>Price: </td> <td><form:input path="price"/></td>

 <tr> <td><span style="margin-left:25px;font-size:90%;"><label>Category:</label></span></td>
	    <td> <span style="margin-left:80px;"><form:select path="category_name" required="true"></span>
				<c:forEach items="${allCategory}" var="obj">
								<form:option class="input1" value="${obj.id}">${obj.name}</form:option>
							</c:forEach>
								</form:select></td>
								</tr>
								
								<br>
								<tr><td><br><span style="margin-left:28px;font-size:90%;"><label><br>Supplier:</label></span></td>
				<td><br><br><span style="margin-left:80px;"><form:select path="supplier_name" required="true"></span>
				<c:forEach items="${allSupplier}" var="obj">
								<form:option class="input1" value="${obj.id}">${obj.name}</form:option>
							</c:forEach>
								</form:select></td></tr>
	     
		<tr> <td>image: </td> <td><form:input type="file" path="image" required="true"/></td>
		
  
 <tr> <td colspan="2">
  <c:if test="${product.id==0}">
 <input type="submit" value="Add" id="btn-add"> 
</c:if>
 <c:if test="${product.id!=0}">
<input type="submit" value="Update" id="btn-update"> 
</c:if>
</td> 
<tr> <td colspan="2" class="success-msg">
 <c:out value="${msg}"/>
</td> 
</table>
 <table>   
	<tr>
		<td> ID </td>
		 <td> Name </td>
	  <td> Description</td>
	  <td>Price</td>
		 <td>supplier_name</td>
          <td>category_name</td>
          <td>image</td>				
<td colspan="2"> Action </td>
</tr>
    	      <c:forEach var="obj" items="${allData}">
		      <tr>
		                 <td> <c:out value="${obj.id}"/> </td>
		                 <td> <c:out value="${obj.name}"/> </td>
				 <td> <c:out value="${obj.description}"/> </td>
				 <td> <c:out value="${obj.price}"/> </td>
				 <td> <c:out value="${obj.supplier_name}"/> </td>
				<td> <c:out value="${obj.category_name}"/> </td>
				
				<td><div class="thumbnail">
								<img height="50px" width="50px" alt="${obj.id }"
									src="<c:url value="/resources/images/Product/${obj.id }.jpg"></c:url>">
									</div> 
				 <td> <a href="deleteProductById/${obj.id}">Delete </a> /
				     <a href="productById/${obj.id}">Edit</a> 
				     
<!-- 
    <div class="btn-toolbar">
<button class="btn btn-primary">Adauga utilizator</button>
</div>
<div class="well">
    <table class="table">
      <thead>
        <tr>
          <th>#</th>
          <th>Prenume</th>
          <th>Nume</th>
          <th>Utilizator</th>
          <th>Rol</th>
          <th style="width: 36px;"></th>
        </tr>
      </thead>
      <tbody>
        
<a href="user.html"><i class="icon-pencil"></i></a>
<a href="#myModal" role="button" data-toggle="modal"><i class="icon-remove"></i></a>
</td>
       </tr>
     </tbody>
   </table>
</div>
<div class="pagination">
    <ul>
        <li><a href="#">Prev</a></li>
        <li><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">Next</a></li>
    </ul>
</div>
			     <div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">Delete Confirmation</h3>
    </div>
    <div class="modal-body">
        <p class="error-text">Are you sure you want to delete the user?</p>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
        <button class="btn btn-danger" data-dismiss="modal">Delete</button>
    </div> 
 -->				     
				 </td>
		      </tr>
	      </c:forEach>
          </table> 
 </form:form>

</body>
</html> 