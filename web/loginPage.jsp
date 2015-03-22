<%-- 
    Document   : loginPage
    Created on : Mar 21, 2015, 9:34:35 PM
    Author     : Kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <%@include file="navbar.html" %>
        <div class="container">
            


            <!--login form-->
            <div class="modal-content col-md-6 col-md-offset-3">
                <form id="loginForm" class="form-horizontal" action="LoginOut" method="post" role="form">
                    <div class="modal-header"><h2>Manager/Staff Login</h2></div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="userName" class="col-sm-2 control-label">Username</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="userName" id="userName" placeholder="Username" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">Password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="password" id="password" placeholder="Password" required>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <a href="index.html" class="btn btn-default">Cancel</a>
                        <button type="submit"  value="login" name="login" class="btn btn-primary">Submit</button>

                    </div>
                </form><!--/login form-->
            </div><!--login form end here-->
        </div><!--/container-->


        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="http://cdn.jsdelivr.net/jquery.validation/1.13.1/jquery.validate.min.js"></script>
        <script src="js/formValidation.js"></script>
    </body>
</html>
