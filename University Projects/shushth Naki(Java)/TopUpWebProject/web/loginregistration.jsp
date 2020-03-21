<%-- 
    Document   : loginregistration
    Created on : Mar 24, 2018, 5:21:04 PM
    Author     : Riad
--%>
<%@ page import = "java.io.*,java.util.*" %>
<%
    String msg = (String) session.getAttribute("registration");
    if (msg == null) {
        msg = " ";
    }
    String s = (String) session.getAttribute("loginstatus");
    if (s == null) {
        s = " ";
    }
%>

<%@ include file="header.jsp" %> 
<br><br><br>

<section>
    <div class="container-fluid" style="background-image:url(images/reg.jpg)">
        <div class="container" id="reg">
            <div class="well">
                <h2 id="registration">Registration form</h2>
                <h2><%=msg%></h2>
                <%session.setAttribute("registration", null);%>
                <form class="form-horizontal" action="RegProcess" id="reg" method="POST">
                    <div class="form-group">
                        <label class="control-label col-xs-2" for="pwd">Name:</label>
                        <div class="col-xs-7">          
                            <input type="text" class="form-control" placeholder="Enter Name" name="username">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="email">Email:</label>
                        <div class="col-xs-7">
                            <input type="email" class="form-control" placeholder="Enter email" name="email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pwd">Password:</label>
                        <div class="col-xs-7">          
                            <input type="password" class="form-control" placeholder="Enter password" name="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pwd">Re-enter Password:</label>
                        <div class="col-xs-7">          
                            <input type="password" class="form-control" placeholder="Re-enter password" name="repass">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pwd">Address:</label>
                        <div class="col-xs-7">          
                            <input type="text" class="form-control" placeholder="Enter Address" name="address">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pwd">Mobile no:</label>
                        <div class="col-xs-7">          
                            <input type="text" class="form-control"  placeholder="Mobile no." name="mobile">
                        </div>
                    </div>


                    <div class="form-group">        
                        <div class="col-xs-11 text-center">
                            <button type="submit" class="btn btn-primary" value="Register">Register</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>


        <div class="container">
            <div class="well-lg">
                <h2 id="registration">Login</h2>
                <h2><%=s%></h2>
                <form class="formhorizontal" action="LoginProcess" method="POST" id="reg">
                    <div class="form-group" id="signup">
                        <label class="control-label col-sm-2" for="pwd">Name:</label>
                        <div class="col-xs-7">          
                            <input type="text" class="form-control" placeholder="Enter Name" name="username"> 
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pwd">Password:</label>
                        <div class="col-xs-7">          
                            <input type="password" class="form-control" placeholder="Enter password" name="password" id="pass">
                        </div>
                    </div>
                    <br><br>
                    <div class="form-group">        
                        <div class="col-xs-11 text-center">
                            <button type="submit" class="btn btn-primary" value="Register">Login</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>




<%@ include file="footer.jsp" %> 
</body>
</html>


