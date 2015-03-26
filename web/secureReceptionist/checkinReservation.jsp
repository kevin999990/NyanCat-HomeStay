<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Room"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entity.Bookinglist"%>
<%@page import="Entity.Booking"%>
<%@page import="java.util.List"%>
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
            List<Booking> bookingPendingCheckin = (List) session.getAttribute("bookingPendingCheckin");

            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            session.removeAttribute("allRoomList");
            List<Room> roomList = (List) session.getAttribute("allRoomList");
            List<Room> availableRoomList = new ArrayList();
            Booking currentBooking = new Booking();
            String bookingId = request.getParameter("id");

            for (int i = 0; i < bookingPendingCheckin.size(); i++) {
                if (bookingPendingCheckin.get(i).getId() == Integer.parseInt(bookingId)) {
                    currentBooking = bookingPendingCheckin.get(i);
                }
            }
            int x = roomList.size();
            for (int i = 0; i < x; i++) {
                if ((roomList.get(i).getRoomtype().getId() == currentBooking.getBookinglistList().get(0).getRoomtypeId().getId())) {
                    if (roomList.get(i).getAvailable()) {
                        availableRoomList.add(roomList.get(i));
                    }
                }

            }

            for (int i = 0; i < currentBooking.getBookinglistList().size(); i++) {
                currentBooking.getBookinglistList().get(i).setRoomId(availableRoomList.get(i));
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
                <h1 class="page-header">Check-In</h1>

                <form id="manageRoomForm" action="../ReservationControl"  class="form-horizontal" method="POST" role="form">

                    <table class="table table-bordered table-striped">
                        <tbody>
                            <tr>
                                <td>Customer Name</td>
                                <td><%=currentBooking.getCustomerId().getCustomername()%></td>
                            </tr>
                            <tr>
                                <td>Customer Email</td>
                                <td><%=currentBooking.getCustomerId().getEmail()%></td>
                            </tr>
                            <tr>
                                <td>Customer Phone Number</td>
                                <td><%=currentBooking.getCustomerId().getPhonenumber()%></td>
                            </tr>
                            <tr>
                                <td>Booking Date</td>
                                <td><%=dateFormat.format(currentBooking.getBookingdate())%></td>
                            </tr>
                            <tr>
                                <td>Date From</td>
                                <td><%=dateFormat.format(currentBooking.getDatefrom())%></td>
                            </tr>
                            <tr>
                                <td>Date To</td>
                                <td><%=dateFormat.format(currentBooking.getDateto())%></td>
                            </tr>
                            <tr>
                                <td>Room Type</td>
                                <td><%=currentBooking.getBookinglistList().get(0).getRoomtypeId().getDescription()%></td>
                            </tr>
                            <%for (int i = 0; i < currentBooking.getBookinglistList().size(); i++) {%>
                            <tr>
                                <td>Room Number</td>
                                <td><%=currentBooking.getBookinglistList().get(i).getRoomId().getRoomnumber()%></td>
                            </tr>
                            <%}%>


                        </tbody>
                    </table>

                    <input id="roomId" hidden name="bookingId"  value="<%=currentBooking.getId()%>">

                    <%
                        session.removeAttribute("currentBooking");
                        session.setAttribute("currentBooking", currentBooking);
                    %>
                    <div class="modal-footer">
                        <a href="reservationMenu.jsp" class="btn btn-default">Back</a>
                        <form action="../ReservationControl" method="post">
                            <button type="submit" id="submitbtn" class="btn btn-primary" value="Checkin" name="action">Check-In</button>
                        </form>

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

