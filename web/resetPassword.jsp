<%-- 
    Document   : loginPage
    Created on : Mar 21, 2015, 9:34:35 PM
    Author     : Kevin
--%>

<%@page import="Entity.Staff"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nyan Cat</title>

    </head>
    <body>
        <%@include file="navbar.html" %>
        <%
            List<Staff> staffList = new ArrayList();
            staffList = (List) session.getAttribute("allStaffList");
        %>
        <div class="container">

            <!--login form-->
            <div class="modal-content col-md-6 col-md-offset-3">
                <form id="resetForm" class="form-horizontal" action="LoginOut" method="post" role="form">
                    <div class="modal-header"><h2>Reset Password</h2></div>
                    <div class="modal-body">
                        <span class="small red">All field are required</span><br>
                        <div class="form-group">
                            <label for="userName" class="col-sm-2 control-label">Username</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="userName" id="userName" placeholder="Username" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="userIc" class="col-sm-2 control-label">IC</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="userIc" id="userIc" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">New Password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="password" id="password" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password2" class="col-sm-2 control-label">Retype Password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="password2" id="password2"  required>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <h4 class="red pull-left"> <%=session.getAttribute("message")%></h4>
                        <a href="index.html" class="btn btn-default">Cancel</a>
                        <button type="submit"  value="reset" name="action" class="btn btn-primary">Submit</button>

                    </div>
                </form><!--/login form-->
            </div><!--login form end here-->
        </div><!--/container-->


        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="${pageContext.request.contextPath}/js/jquery_1.11.2_jquery.min.js" type="text/javascript"></script>  
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/formValidation.js"></script>
    </body>
</html>
