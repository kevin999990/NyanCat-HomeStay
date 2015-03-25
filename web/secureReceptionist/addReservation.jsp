<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entity.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <<head>
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

                <div class="row">
                    <div class="col col-md-6 col-md-offset-1">
                        <form id="reservationForm" class="form-horizontal" action="../CheckRoom" method="get" role="form">
                            <h1 class="modal-header">Reservation</h1>
                            <div class="modal-body">

                                <div class="form-group">
                                    <label for="checkinDate"class="col-sm-4 control-label">Check-in:</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="checkinDate" class="form-control" name="checkinDate" required >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="checkoutDate"class="col-sm-4 control-label">Check-out:</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="checkoutDate"  class="form-control" name="checkoutDate" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="numberOfNight" class="col-sm-4 control-label">Night:</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="numberOfNight" readonly  class="form-control" name="numberOfNight">
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="reset" class="btn btn-default">Reset</button>
                                <button type="submit" value="staff" name="action" class="btn btn-primary">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>        

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
        </footer><!--/Footer-->


        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="${pageContext.request.contextPath}/js/jquery_1.11.2_jquery.min.js" type="text/javascript"></script>  
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.validate_1.13.1_additional-methods.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"></script>
        <script src="${pageContext.request.contextPath}/js/ReservationDate.js"></script>
        <script src="${pageContext.request.contextPath}/js/formValidation.js"></script>
        <script>


        </script>
    </body>
</html>
