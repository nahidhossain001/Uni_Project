<%-- 
    Document   : products
    Created on : Mar 29, 2018, 4:53:17 PM
    Author     : Kaif Ul Majed
--%>


<%@ include file="header.jsp" %> 
<br><br><br>
<section>
    <div class ="container">
        <div class="row">

            <div class ="col-lg-10">
                <h1 class="text-center" id="listhead">Our list of medicines</h1>
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr class="bg-primary">
                            <th>ID</th>
                            <th>Name</th>
                            <th>Generic Name</th>
                            <th>Manufacturer</th>
                            <th>Type</th>
                            <th>Price(Tk.)</th>
                            <th>Quantity</th>
                        </tr> 
                    </thead>
                    <tbody>
                        <c:forEach items="${meds}" var="med">   
                            <tr>
                                <td><c:out value="${med.id}" /></td>
                                <td><c:out value="${med.name}" /></td>
                                <td><c:out value="${med.generic_name}" /></td>
                                <td><c:out value="${med.manufacturer}" /></td>
                                <td><c:out value="${med.type}" /></td>
                                <td><c:out value="${med.price}" /></td>
                                <td>
                                    <form action="CartServlet" method="POST">
                                        <input type="number" name="quantity" placeholder="Quantity" min="0" max="${med.quantity}"/>
                                        <input type="text" hidden="true" name="id" value="${med.id}"/>
                                        <button type="submit" class="btn btn-info" value="Add to cart"/>Add to cart</button> <br>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="col-xs-2" id="capsule">
                <ul>
                    <li>
                        <form action="ProductsServlet" method="POST">
                            <input type="hidden" name="cat" value="capsule"/>
                            <button type="submit" class="btn btn-default" value="Capsule" />Capsule</button>
                        </form>
                    </li>

                    <li>
                        <form action="ProductsServlet" method="POST">
                            <input type="text" name="cat" hidden="true" value="tablet"/>
                            <button type="submit" class="btn btn-default" value="Tablet"/>Tablet </button>
                        </form>                                
                    </li>

                </ul>
            </div>
        </div>
    </div>
</section>
<%@ include file="footer.jsp" %> 
</html>