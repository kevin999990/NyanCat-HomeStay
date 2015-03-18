<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
        <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

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
            <div class="row" >
                <div class="col col-md-6 col-md-offset-2">
                    <form method="post" action="../StaffControl">
                    <table class="table table-bordered ">
                        <tr>
                            <td>ID:</td>
                            <td>${newStaff.id}</td>
                        </tr>
                        <tr>
                            <td>Name:</td>
                            <td>${newStaff.name}</td>
                        </tr>
                        <tr>
                            <td>Address:</td>
                            <td>${newStaff.address}</td>
                        </tr>
                        <tr>
                            <td>IC:</td>
                            <td>${newStaff.ic}</td>
                        </tr>
                        <tr>
                            <td>Phone:</td>
                            <td>${newStaff.phoneNumber}</td>
                        </tr>
                        <tr>
                            <td>Username:</td>
                            <td>${newStaff.username}</td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td>${newStaff.password}</td>
                        </tr>
                    </table>
                        <input type="submit" class="btn btn-primary" value="add" name="action"> 
                        <input type="submit" class="btn btn-danger" value="cancel" name="action">
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
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
    </body>
</html>