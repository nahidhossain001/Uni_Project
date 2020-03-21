

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %> 
<div class="container-fluid" style="background-image: url(images/cart.png)">
    <div class="container"> 
        <div class="well">
            <div class ="row">
                <h1 class="text-center">Welcome to your profile</h1>
                <h2 class="text-center" style="text-decoration:underline">Order History</h2>
                <br>
                <c:forEach items="${orders}" var="order" varStatus="status">
                    <div class="col-xs-7 col-xs-offset-2 ">
                        <table class="table table-bordered">

                            <thead class="bg-primary">
                            <th>Delivered to</th>
                            <th>Delivered on</th>
                            <th>Total Price</th>
                            </thead>
                            <tbody class="tpro">
                                <tr>
                                    <td><c:out value="${order.address}"/></td>
                                    <td><c:out value="${order.date}"/></td>
                                    <td><c:out value="${order.price}"/></td>
                                </tr>
                            </tbody>
                        </table>
                        <table class="table table-condensed table-hover">
                            <thead class="bg-primary">
                            <th>Medicine No.</th>
                            <th>Quantity</th>
                            </thead>
                            <c:forEach items="${items[status.index]}" var="item">
                                <tbody class="tpro">
                                    <tr>
                                        <td><c:out value="${item.med_id}"/></td>
                                        <td><c:out value="${item.quantity}"/></td>
                                    </tr>
                                </tbody>
                            </c:forEach>            
                        </table>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %> 
</html>
