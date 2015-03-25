<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entity.*"%>
<%@page import="java.util.List"%>
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

        <%
            List<Booking> bookingPendingCheckin = (List<Booking>) session.getAttribute("bookingPendingCheckin");
            Booking currentBooking = new Booking();
            for (Booking bk : bookingPendingCheckin) {
                if (bk.getId() == Integer.parseInt(request.getParameter("id"))) {
                    currentBooking = bk;
                }
            }


        %>
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
                <table class="table table-bordered table-striped">
                    <tbody>
                        <tr>
                            <td>Customer Name:</td>
                            <td><%=currentBooking.getCustomerId().getCustomername()%></td>
                        </tr>
                        <tr>
                            <td>Customer Email:</td>
                            <td><%=currentBooking.getCustomerId().getEmail()%></td>
                        </tr>
                        <tr>
                            <td>Customer Phone Number:</td>
                            <td><%=currentBooking.getCustomerId().getPhonenumber()%></td>
                        </tr>
                        <tr>
                            <td>Need to Pay</td>
                            <td><%=currentBooking.getNeedtopay()%></td>
                        </tr>
                        <tr>
                            <td>Room</td>
                            <td>
                                <%for (int i = 0; i < currentBooking.getBookinglistList().size(); i++) {%>
                                <%=currentBooking.getBookinglistList().get(i).getRoomId().getRoomnumber()%>
                                <%}%>
                            </td>
                        </tr>

                        <tr>
                            <td>Booking Room</td>
                            <td><%=currentBooking.getBookinglistList().size() + " " + currentBooking.getBookinglistList().get(0).getRoomtypeId().getDescription()%></td>
                        </tr>



                    </tbody>
                </table>

                <form action="../ReservationControl" method="POST">
                    <%
                        session.removeAttribute("currentBooking");
                        session.setAttribute("currentBooking", currentBooking);
                    %>
                    <div class="modal-footer">
                        <a href="reservationMenu.jsp" class="btn btn-default">Back</a>
                        <button class="btn btn-info"name="action" value="Checkout">Check-out</button>

                    </div>
                </form>


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
