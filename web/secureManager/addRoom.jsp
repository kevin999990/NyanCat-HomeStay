<%@page import="java.util.List"%>
<%@page import="Entity.*"%>
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

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

        <%
            List<Roomtype> roomtypeList = (List) session.getAttribute("allRoomTypeList");
          
        %>
        <!-- Header and Navigation Bar-->
        <jsp:useBean id="loginStaff" scope="session" class="Entity.Staff" />
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
                        <li><a href="../RoomControl">Manage Room</a></li>
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
                <h1 class="page-header">Add Room</h1>





                <form id="manageRoomForm" action="../RoomControl"  class="form-horizontal" method="POST" role="form">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-1">

                            <div class="row">
                                <div class="col-sm-6 col-sm-offset-1">
                                    <span class="small red">Fill all field with <span class=" h4" >*</span></span>
                                </div>
                            </div>
                            <input hidden id="roomNumber" name="staffId" value="">
                            <div class="form-group">
                                <label for="roomNumber" class="col-sm-4 control-label">Room Number<span class="red h4" > *</span></label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="roomNumber" name="roomNumber">
                                </div>
                            </div>



                            <div class="form-group">
                                <label for="roomtype" class="col-sm-4 control-label">Room Type</label>
                                <div class="col-sm-8">

                                    <select class="form-control" name="roomtype" id="roomtype">
                                        <% for (int i = 0; i < roomtypeList.size(); i++) {%>
                                        <option><%=roomtypeList.get(i).getDescription()%></option><%}%>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="reset"  id="resetbtn" class="btn btn-default" value="Reset"> Reset</button>
                        <button type="button" id="okbtn" class="btn btn-primary" >OK</button>
                        <button type="submit" id="submitbtn" class="btn btn-primary" value="add" name="action">Submit</button>
                    </div>

                </form>


            </section>


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
            <script>
                $("#submitbtn").hide();
                $("#okbtn").click(function () {
                    $("#manageRoomForm input").attr('readonly', 'true');
                    $("#manageRoomForm textarea").attr('readonly', 'true');
                    $("#manageRoomForm select").attr('disabled', 'true');
                    alert("Please check the information is correct.");
                    $("#okbtn").hide();
                    $("#submitbtn").show();
                    $("html, body").animate({scrollTop: 100}, 100);
                });
                $("#resetbtn").click(function () {
                    $("#submitbtn").hide();
                    $("#okbtn").show();
                    $("#manageRoomForm input").removeAttr('readonly');
                    $("#manageRoomForm textarea").removeAttr('readonly');
                    $("#disabledInput").attr('readonly', true);
                    $("#manageRoomForm select").removeAttr('disabled');


                });

                $("#submitbtn").click(function () {
                    $("#submitbtn").hide();
                    $("#okbtn").show();
                    $("#manageRoomForm input").removeAttr('readonly');
                    $("#disabledInput").attr('readonly', true);
                    $("#manageRoomForm textarea").removeAttr('readonly');
                    $("#manageRoomForm select").removeAttr('disabled');
                });







            </script>
    </body>
</html>