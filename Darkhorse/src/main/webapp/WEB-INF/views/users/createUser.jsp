<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<spring:url value="/users/changePassword" var="chgpass"/>
<spring:url value="/users/showPaymentLog" var="spl"></spring:url>
<spring:url value="/users/usageLog" var="usageLog"/>
<section class="large-12">
<div class="container">
<div class="">
<div class="messsage">
<div style="margin-left: 250px;"><h4>Create user</h4></div>
<c:if test="${not empty message}">
<span class="error"></span>
</c:if>
</div>
	<form:form commandName="user" id="user" class="form-horizontal">
	 <form:hidden path="id" />
	 
	 <div class="col-sm-4">
	 <label>Email Id</label>
	 <form:input path="email"/>
	 </div>

	 <div class="col-sm-5">
	 <label>Password</label>
	 <form:input path="passwd" />
	 </div>
	
	 <div class="col-sm-4">
	 <label>Name</label>
	 <form:input path="name"/>
	 </div>
	
	 
	 <div class="col-sm-5">	
	 <label>Enable</label>
	 <form:checkbox path="isEnabled"/>
	 </div>
	 
	 <div class="col-sm-9">
	 <label></label>
	 <input type="submit" value="save">
	 </div>
	 
	 
	 </form:form>
</div>
</div>
</section>
