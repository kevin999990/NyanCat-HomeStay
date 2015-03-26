<%-- 
    Document   : controlPanel
    Created on : Mar 18, 2015, 12:14:57 AM
    Author     : Kevin
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entity.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NyanCat HomeStay</title>

        <!-- Bootstrap -->
        <link rel="icon" href="${pageContext.request.contextPath}/img/logo2.png">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css"  rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/css/custom.css"  rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/css/font-awesome_4.0.3_css_font-awesome.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <jsp:useBean id="loginStaff" scope="session" class="Entity.Staff" />


        <!-- Header and Navigation Bar-->
        <div class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">  
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">NyanCat HomeStay</a>
                </div>

                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-left">
                        <li><a href="../ReservationControl">Manage Reservation</a></li>
                        <li><a href="../RoomControl">Manage Room</a></li>
                        <li><a href="../StaffControl">Manage Staff</a></li>
                        <li><a href="managerControlPanel.jsp">Report</a></li>

                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a class="disabled sr-only-focusable">Welcome ${loginStaff.staffname}</a></li>
                        <li><a href="../LoginOut" data-toggle="modal">Logout</a></li>
                    </ul>
                </div><!-- .nav-collapse-->
            </div>
        </div> <!-- Navigation Bar End Here-->

        <div class="container">
            <section>
                <table class="table">
                    <tr>
                        <td></td>
                        <td><a href="#" class="btn btn-primary">Generate Report</a></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a href="#" class="btn btn-primary">Generate Report</a></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a href="#" class="btn btn-primary">Generate Report</a></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a href="#" class="btn btn-primary">Generate Report</a></td>
                    </tr>
                </table>
            </section>
        </div>

        <!--Footer-->
        <hr>
        <footer class="container">
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; NyanCat HomeStay 2015</p>
                </div>
            </div>
            <!-- /.row -->
        </footer>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="${pageContext.request.contextPath}/js/jquery_1.11.2_jquery.min.js" type="text/javascript"></script>  
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/formValidation.js"></script>
    </body>
</html>
