<%-- 
    Document   : checkout
    Created on : Mar 31, 2018, 5:49:46 PM
    Author     : Kaif Ul Majed
--%>
<%@ include file="header.jsp" %> 
<br><br><br>
<section>    

    <div class="container">                    
        <h1>Billing Details</h1>
        <form action="CheckoutServlet" method="POST" id="reg">


            <div class="form-group" id="signup">
                <label class="control-label col-sm-2" for="pwd">Name:</label>
                <div class="col-xs-7">          
                    <input type="text" class="form-control" placeholder="Enter Name" name="name"> 
                </div>
            </div> <br>
            <div class="form-group" id="signup">
                <label class="control-label col-sm-2" for="pwd">Street:</label>
                <div class="col-xs-7">          
                    <input type="text" class="form-control" placeholder="Enter Street" name="street"> 
                </div>
            </div><br>
            <div class="form-group" id="signup">
                <label class="control-label col-sm-2" for="pwd">City:</label>
                <div class="col-xs-7">          
                    <input type="text" class="form-control" placeholder="Enter City" name="city"> 
                </div>
            </div><br>
            <div class="form-group" id="signup">
                <label class="control-label col-sm-2" for="pwd">District:</label>
                <div class="col-xs-7">          
                    <input type="text" class="form-control" placeholder="Enter District" name="district"> 
                </div>
            </div><br>
            <div class="form-group" id="signup">
                <label class="control-label col-sm-2" for="pwd">ZIP:</label>
                <div class="col-xs-7">          
                    <input type="text" class="form-control" placeholder="Enter ZIP" name="zip"> 
                </div>
            </div><br>

            <div class="form-group"id="signup">
                <label class="control-label col-sm-2" for="pwd">Mobile Phone:</label>
                <div class="col-xs-7">          
                    <input type="text" class="form-control" placeholder="Enter Phone no." name="phone" >
                </div>
            </div>
            <br>


            <!--    <input type="text" name="name" placeholder="Full Name"/><br>
                </div>
                <input type="text" name="street" placeholder="Street Address"/><br>
                <input type="text" name="city" placeholder="City"/><br>
                <input type="text" name="district" placeholder="District"/><br>
                <input type="text" name="zip" placeholder="Postcode/ZIP"/><br>
                <input type="text" name="phone" placeholder="Contact Number"/><br> 
                <h2>Your Order Details Below</h2> -->

            <div class="row">
                <div class="container">
                    <h2 style="font-weight:bold">Your Orders</h2>
                    <div class="col-xs-8">
                        <table class="table table-bordered" id="checktb">
                            <thead>
                                <tr class="bg-primary">
                                    <th>Medicine Name</th>                                                   
                                    <th>Quantity</th>
                                    <th>Price</th>
                                </tr>
                            </thead>

                            <c:set var="total" value="1"/>
                            <c:forEach items="${cart}" var="cart" varStatus="status">
                                <c:set var="med" value="${meds[status.index]}"/>

                                <tr>
                                    <td><c:out value="${med.name}" /></td>
                                    <td><c:out value="${cart.quantity}" /></td>
                                    <td><c:out value="${Math.round(med.price * cart.quantity * 100.0)/100.0}"/></td>
                                    <c:set var="total" value="${total + Math.round(med.price * cart.quantity * 100.0)/100.0}"/>
                                </tr>

                            </c:forEach>
                            <td>Total Price</td>
                            <td></td>
                            <td>${total}</td>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-xs-6">
                <button type="submit" value="Place Order" class="btn btn-primary" id="orderbt">Place Order </button>
        </form>
    </div>
</div>

</section>  



<%@ include file="footer.jsp" %> 
</html>