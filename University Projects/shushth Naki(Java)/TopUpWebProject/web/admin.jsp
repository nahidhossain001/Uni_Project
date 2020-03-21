<%-- 
    Document   : admin
    Created on : Mar 29, 2018, 3:33:44 PM
    Author     : Riad
--%>
<%@ include file="header.jsp" %> 	
<br><br><br>
<%    String s = (String) session.getAttribute("addstatus");
%>
<section>
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-sm-12">
                <h2><%=s%></h2>
                <%session.setAttribute("addstatus", " ");%>
                <h1>Add medicine</h1>

                <form action="AdminServlet" method="POST">
                    <input type="text" name="name" placeholder="Name"/><br>
                    <input type="text" name="genericname" placeholder="Generic Name"/><br>
                    <input type="text" name="type" placeholder="Type of medicine"/><br>
                    <input type="text" name="manufacturer" placeholder="Manufacturer"/><br>
                    <input type="text" name="price" placeholder="Price"/><br>
                    <input type="number" name="quantity" placeholder="Quantity"/><br><br>
                    <input type="file" name="pic" accept="image/*"><br><br>
                    <input type="submit" value="Add to store"/><br>
                </form>
            </div>
            <div class="col-lg-6 col-sm-12">


                <h1>Delete Medicine </h1>

                <form action="LoginProcess" method="POST">
                    <input type="text" name="name" placeholder="Name"/> <br>
                    <input type="text" name="type" placeholder="Type"/> <br><br>
                    <input type="submit" value="Delete"/><br>
                </form>                
            </div>
        </div> 
    </div>
</section>

<%@ include file="footer.jsp" %> 
</html>


