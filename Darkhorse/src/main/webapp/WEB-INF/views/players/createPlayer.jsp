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
<div class="clearfix"></div>
<div style="margin-left: 250px;"><h4>Create player</h4></div>
</div>
	<form:form commandName="player" name="player" id="player" class="form-horizontal">
	 <form:hidden path="id" />
	 <form:hidden path="user.id" />
	 
	 <div class="col-sm-4">
	 <label>Name</label>
	 <form:input path="user.name"/>
	 </div>

	 <div class="col-sm-5">
	 <label>Email</label>
	 <c:choose>
	 <c:when test="${update eq true}">
	 	<form:input path="user.email" />
	 </c:when>
	  <c:otherwise>
	  	<form:input path="user.email"/>
	  </c:otherwise>
	 </c:choose>
	 
	 
	 </div>
	
	 <div class="col-sm-4">
	 <label>Password</label>
	 <form:input path="user.passwd"/>
	 </div>
	
	
	 <div class="col-sm-5">
	 <label>Level</label>
		<form:select path="playerLevel">
		<c:forEach items="${playerLevels}" var="pl">
		 <form:option value="${pl}">${pl}</form:option>
		</c:forEach>
		</form:select>	 
	 </div>


	 <div class="col-sm-4">
	 <label>About</label>
	 <form:textarea path="about"/>
	 </div>
	 
	 <div class="col-sm-5">
	 <label>Address</label>
	 <form:textarea path="contact.area"/>
	 </div>
	 
	 <div class="col-sm-4">
	 <label>City</label>
	 <form:input path="contact.city"/>
	 </div>
	 
	 <div class="col-sm-5">
	 <label>State</label>
	 <form:input path="contact.state"/>
	 </div>
	 
	 <div class="col-sm-4">
	 <label>Pincode</label>
	 <form:input path="contact.pincode"/>
	 </div>

	 <div class="col-sm-5">
	 <label>Mobile No.</label>
	 <form:input path="contact.mobileNo"/>
	 </div>

	 <div class="col-sm-4">
	 <label>Career Heighlights</label>
	 <form:textarea path="careerHeighlights"/>
	 </div>
	 
	 <div class="col-sm-5">
	 <label>Profile Links</label>
	 <form:textarea path="profileLinks"/>
	 </div>
	 
	 <div class="col-sm-4">
	 <label>Hobbies and Intrest</label>
	 <form:textarea path="hobbiesAndIntrest"/>
	 </div>
	 
<%-- 	 <div class="col-sm-5">
	 <label>DOB</label>
	 <form:input path="DOB" class="datepicker" placeholder="dd M yyyy"/>
	 </div>
 --%>	 
	 <div class="col-sm-4">	
	 <label>Enable</label>
	 <input type="checkbox" checked="checked" name="checkbox"/>
	 </div>
	 
	 <div class="col-sm-5">
	 <label></label>
	 <input type="submit" value="save">
	 </div>
	 
	 
	 </form:form>
</div>
</div>
</section>
