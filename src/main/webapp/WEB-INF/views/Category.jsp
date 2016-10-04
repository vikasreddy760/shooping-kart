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
  <c:url var="addAction" value="addCategory" ></c:url> <!-- //jstl tag available in core tag library// -->

<form:form action="${addAction}" modelAttribute="category" id="btn-add"><!-- wen ever we click botton it should perform some Action -->
   <h3>
                    <c:if test="${category.id==0}">
		       Add New Category
	            </c:if>
	            <c:if test="${!empty category.id}">
		      Update Category for Id: <c:out value="${category.id}"/>
		      <form:hidden path="id"/>
	            </c:if>
         </h3>
	  <table>
	  
	  <tr>  <c:if test="${category.id!=0}">
	  <td> Id:</td> <td><form:input  path="id"/></td> 
	   </c:if>
	    <tr> <td> Name:</td> <td><form:input  path="name"/></td>
	    
	    <tr> <td>Description:</td> <td><form:input path="description"/> </td> 
	    
	    <tr> <td colspan="2">
    	        <c:if test="${category.id==0}">
			      <input type="submit" value="Add" id="btn-add"> 
	         </c:if>
	         <c:if test="${category.id!=0}">
			      <input type="submit" value="Update" id="btn-update"> 
	         </c:if>
		</td> 
		<tr> <td colspan="2" class="success-msg">
		   <c:out value="${msg}"/>
		</td> 
	  </table>
	  
	  <table>   
			<tr>
			 	<th> ID </th>
		        <th> Name </th> 
				 <th> Description</th>
				<!-- <td>Price</td> -->
				 <th colspan="2"> Action </th>
	      	</tr>
    	      <c:forEach var="obj" items="${allCategory}">
		      <tr>
		                 <td> <c:out value="${obj.id}"/> </td>		               
		                 <td> <c:out value="${obj.name}"/> </td>
				 <td> <c:out value="${obj.description}"/> </td>
		
				
				  <td> <a href="deleteCategoryById/${obj.id}"> 
				 <span class="glyphicon glyphicon-remove"> </span> Delete</a>
				     <a href="CategoryById/${obj.id}">
				     <span class="glyphicon glyphicon-edit"> </span> Edit</a>
				 </td>
		      </tr>
	      </c:forEach>
	      </table>
           
 </form:form>
</body>
</html>   