<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ include file="headcontent.jspf" %>
<body>
<%@ include file="header.jspf" %>
<div class="container-fluid">
    <div class="row row-content">
        <%@ include file="sidebar.jspf" %>
        <div class="content col-md-5 col-md-offset-2">
            <c:if test="${problems != null}"><c:forEach items="${problems}" var="problem"><p>${problem}.</p></c:forEach></c:if>
		    <h1>Thanks for signing up!</h1>
		    <p><strong>Name:</strong> ${name}</p>
		    <p><strong>Email: </strong>${email}</p>
		    <p>please <a href="${pageContext.request.contextPath}/Index.jsp">login</a></p>
        </div>
    </div>
</div>
<%@ include file="footer.jspf" %>
</body>
</html>