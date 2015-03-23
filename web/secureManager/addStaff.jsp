<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:useBean id="staff" scope="session" class="Entity.Staff" />
<%session.removeAttribute("newStaff");%>
<jsp:useBean id="newStaff" scope="session" class="Entity.Staff" />
<jsp:setProperty name="newStaff" property="*"/>
<html>
    <head>

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

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
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
                        <li><a href="#">Guest Check-in</a></li>
                        <li><a href="#">Cencel Reservation</a></li>
                        <li><a href="#">Manager Staff</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a class="disabled sr-only-focusable">Welcome ${staff.name}</a></li>
                        <li><a href="../Logout" data-toggle="modal">Logout</a></li>
                    </ul>
                </div><!-- .nav-collapse-->
            </div>
        </div> <!-- Navigation Bar End Here-->

        <div class="container">
            <div class="row">
                <div class="col col-md-6 col-md-offset-2">

                    <form class="form-horizontal" role="form" action="staffConfirmation.jsp">
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">Name</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="name" name="name" placeholder="Stellyn">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="address" class="col-sm-2 control-label">Address</label>
                            <div class="col-sm-6">
                                <textarea class="form-control" id="address" name="address"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="ic" class="col-sm-2 control-label">IC</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="ic" name="ic" placeholder="000000-00-0000">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="phoneNumber" class="col-sm-2 control-label">Phone Number</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="0123456789">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="username" class="col-sm-2 control-label">Username</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="username" name="username">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">Password</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="password" name="password">
                            </div>
                        </div>



                        <div class="col-sm-2">
                            <button class="btn btn-default" type="submit" name="submit" value="submit">Submit</button>
                        </div>
                    </form>
                </div>
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
            <script src="js/jquery_1.11.2_jquery.min.js" type="text/javascript"></script>
            <script src="js/bootstrap.min.js"></script>
    </body>
</html>