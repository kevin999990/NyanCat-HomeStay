<%-- 
    Document   : guestReservation
    Created on : Mar 21, 2015, 9:51:52 PM
    Author     : Kevin
--%>

<%@page import="Entity.Bookinglist"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="Entity.Booking"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Booking newBooking = (Booking) session.getAttribute("newBooking");%>
<% List<Bookinglist> newBookinglist = (List<Bookinglist>) session.getAttribute("newBooklist");%>
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

                <!-- Reservation Form -->
                <div class="row">
                    <h1 id="h1title" class="page-header"> Guest Reservation </h1>
                    <!--Room Detail-->
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <h4 class="modal-header">Reserve Detail</h4>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <td>Room</td>
                                        <td>From</td>
                                        <td>To</td>
                                        <td>Night</td>
                                        <td>Suite</td>
                                        <td>Rate per Night (RM)</td>
                                        <td>Total (RM)</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (int i = 0; i < newBookinglist.size(); i++) {%>
                                    <tr>
                                        <td><%= i + 1%></td>
                                        <td><%= new SimpleDateFormat("dd/MM/yyyy").format(newBooking.getDatefrom())%></td>
                                        <td><%= new SimpleDateFormat("dd/MM/yyyy").format(newBooking.getDateto())%></td>
                                        <td><%= session.getAttribute("numberOfNight")%></td>
                                        <td><%= newBookinglist.get(i).getRoomtypeId().getDescription()%></td>
                                        <td><%= newBookinglist.get(i).getRoomtypeId().getPrice()%></td>
                                        <td><%= Integer.parseInt(session.getAttribute("numberOfNight").toString()) * newBookinglist.get(i).getRoomtypeId().getPrice()%></td>
                                    </tr>
                                    <% }%>
                                    <tr> 
                                        <td colspan="6"  >Grand Total:</td>
                                        <td ><%= newBooking.getNeedtopay()%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div><!--/Room detail-->

                    <form id="guestReserveForm" action="../GuestReservation"  class="form-horizontal" method="POST" role="form">
                        <div class="row">
                            <div class="col-md-5 col-md-offset-1">

                                <h4 class="modal-header">Personal Detail  </h4>
                                <div class="row">
                                    <div class="col-sm-6 col-sm-offset-1">
                                        <span class="small red">Fill all field with <span class=" h4" >*</span></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="customerName" class="col-sm-3 control-label">Name <span class="h4 red"> *</span></label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="customerName" name="customerName" placeholder="Jane Doe">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="email" class="col-sm-3 control-label">Email<span class="h4 red"> *</span></label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" id="email" name="email" placeholder="jane.doe@example.com">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="phoneNumber" class="col-sm-3 control-label">Phone Number</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="60161234567" maxlength="12">
                                    </div>
                                </div>
                                <!-- is this needed?
                                
                                <div class="form-group">
                                    <label for="ic" class="col-sm-3 control-label">NIRC / Passport No.</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="ic" name="ic" placeholder="908765-12-5678">
                                    </div>
                                </div> -->
                                <div class="form-group">
                                    <label for="address" class="col-sm-3 control-label">Address<span class="h4 red"> *</span></label>   
                                    <div class="col-sm-9">
                                        <textarea class="form-control" rows="3" id="address" name="address" maxlength="80" style="resize: none" ></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="reset"  id="resetbtn" class="btn btn-default" value="Reset"> Reset</button>
                            <button type="button" id="okbtn" class="btn btn-primary" >OK</button>
                            <button type="submit" id="submitbtn" class="btn btn-primary" value="Submit">Submit</button>
                        </div>
                    </form>
                </div><!--/Reservation Form-->

            </section>
        </div><!-- /container-->
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
        <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/formValidation.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    </body>

    <script>

        $("#submitbtn").hide();
        $("#okbtn").click(function () {
            $("#guestReserveForm input").attr('readonly', 'true');
            $("#guestReserveForm textarea").attr('readonly', 'true');
            $("#guestReserveForm select").attr('disabled', 'true');
            alert("Please check the information is correct.");
            $("#okbtn").hide();
            $("#submitbtn").show();
            $("html, body").animate({scrollTop: 400}, 100);
        });
        $("#resetbtn").click(function () {
            $("#submitbtn").hide();
            $("#okbtn").show();
            $("#guestReserveForm input").removeAttr('readonly');
            $("#guestReserveForm textarea").removeAttr('readonly');
            $("#disabledInput").attr('readonly', true);
            $("#guestReserveForm select").removeAttr('disabled');

        });

        $("#submitbtn").click(function () {
            $("#submitbtn").hide();
            $("#okbtn").show();
            $("#guestReserveForm input").removeAttr('readonly');
            $("#disabledInput").attr('readonly', true);
            $("#guestReserveForm textarea").removeAttr('readonly');
            $("#guestReserveForm select").removeAttr('disabled');


        });

    </script>
</html>