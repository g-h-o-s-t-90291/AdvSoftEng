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
				<c:choose>
				<c:when test="${bid != null}"><h1>Edit Bid</h1><br/>
					<form action="${pageContext.request.contextPath}/editBid2" method="post">
						<input type="hidden" name="BidID" value="<c:out value="${bid.getBidID()}"/>"/>
						<label for="Product">Product: </label> ${bid.getItem_name()} <span class="note">(due to how bids are processed, products can not be changed at this time.)</span><br/>
						<label for="Seller">Seller: </label> ${bid.getSeller_name()}<br>
						<label for="EndDate">Bid Date: </label> ${bid.getPostedDate()}<br>
						<label for="BaseCost">Cost per unit: </label> $<input type="text" name="BaseCost" id="BaseCost" value="<c:out value="${bid.getProposedPrice()}"/>"><br>
						<label for="MinPurchase">Quantity Ordered: </label><input type="text" name="MinPurchase" id="MinPurchase" value="<c:out value="${bid.getQuantity()}"/>"><br>
			        	<input type="submit" name="update" value="Update">
					</form>
				</c:when>
				<c:when test="${details != null}"><h1>Accepted Bid Details</h1> <br/>
					<c:choose>
					<c:when test="${user.getID() == details.getSellerID()}"><%-- they are the seller, so show the bidder name/address --%>
						Seller:  <c:out value="${address.asHTMLString()}"/> <br>
					</c:when>
					<c:otherwise><%-- they are the bidder, so show the bidder name/address --%>
						Bidder:  <c:out value="${address.asHTMLString()}"/> <br>
					</c:otherwise>
					</c:choose>
					Product:  <c:out value="${details.getItem_name()}"/> 
					Bid Date:  <c:out value="${details.getPostedDate()}"/> <br>
					Acceptance Date:  <c:out value="${details.getPostedDate()}"/> <br>
					Cost per unit: $<c:out value="${details.getProposedPrice()}"/> <br>
					Quantity Ordered: <c:out value="${details.getQuantity()}"/> <br>
				</c:when>
				<c:otherwise><h1>Add New Bid</h1><br/>
					<form action="${pageContext.request.contextPath}/newBid2" method="post">
						<input type="hidden" name="SellerID" value="<c:out value="${sellerID}"/>"/>
						<input type="hidden" name="ItemID" value="<c:out value="${listing.getProdID()}"/>"/>
						<label for="Product">Product: </label><c:out value="${listing.getProdName()}"/><br>
						<label for="Seller">Seller: </label><c:out value="${sellerName}"/><br>
						<label for="BaseCost">Cost per unit: </label> $<input type="text" name="BaseCost" id="BaseCost" value="<c:out value="${listing.getBaseCost()}"/>"><br>
						<label for="MinPurchase">Quantity Ordered: </label><input type="text" name="MinPurchase" id="MinPurchase" value="<c:out value="${listing.getMinAmount()}"/>"><br>
			        	<input type="submit" name="Create" value="Create">
					</form>
				</c:otherwise>
			</c:choose>
        </div>
    </div>
</div>
<%@ include file="footer.jspf" %>
</body>
</html>