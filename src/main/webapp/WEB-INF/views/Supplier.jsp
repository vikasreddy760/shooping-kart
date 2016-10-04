<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">
<head><title>Admin</title>
 <script src="${pageContext.request.contextPath}/app-resources/js/lib/jquery-2.2.3.min.js"></script>
  <script src="${pageContext.request.contextPath}/app-resources/js/myapp.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-resources/css/style.css"/>
</head>
<style>
.custab{
    border: 1px solid #ccc;
    padding: 5px;
    margin: 5% 0;
    box-shadow: 3px 3px 2px #ccc;
    transition: 0.5s;
    }
.custab:hover{
    box-shadow: 3px 3px 0px transparent;
    transition: 0.5s;
    }
    </style>
<body>
  <c:url var="addAction" value="addSupplier" ></c:url> <!-- //jstl tag available in core tag library// -->

<form:form action="${addAction}" modelAttribute="supplier" id="btn-add"><!-- wen ever we click botton it should perform some Action -->
   <h3>
                    <c:if test="$(supplier.id==0}">
		       Add New Supplier
	            </c:if>
	            <c:if test="${!empty supplier.id}">
		      Update Supplier for Id: <c:out value="${supplier.id}"/>
		      <form:hidden path="id"/>
	            </c:if>
         </h3>
	  <table>
	  
	  <tr>  <c:if test="${supplier.id!=0}">
	  <td> Id:</td> <td><form:input  path="id"/></td> 
	   </c:if>
	    <tr> <td> Name:</td> <td><form:input  path="name"/></td> 
	    <tr> <td>Address:</td> <td><form:input path="address"/> </td> 
	     
		
  
	    <tr> <td colspan="2">
    	        <c:if test="${supplier.id==0}">
			      <input type="submit" value="Add" id="btn-add"> 
	         </c:if>
	         <c:if test="${supplier.id!=0}">
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
				 <td> Address</td>
				
				 <td colspan="2"> Action </td>
	      	</tr>
    	      <c:forEach var="obj" items="${allSupplier}">
		      <tr>
		                 <td> <c:out value="${obj.id}"/> </td>
		                 <td> <c:out value="${obj.name}"/> </td>
				 		<td> <c:out value="${obj.address}"/> </td>
		
				
				 <td> <a href="deleteSupplierById/${obj.id}">Delete </a> 
				     <a href="SupplierById/${obj.id}">Edit</a> 
				 </td>
		      </tr>
	      </c:forEach>
          </table> 
 </form:form>
 
</body>
</html>