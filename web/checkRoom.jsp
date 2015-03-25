<%@page import="java.util.Date"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Guest Reservation</title>

    </head>
    <body>
        <%@include file="navbar.html" %>

        <% int[] roomNumber = (int[]) session.getAttribute("roomNumber");
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            Date dateFrom = (Date) session.getAttribute("dateFrom");
            Date dateTo = (Date) session.getAttribute("dateTo");
        %>

        <div class="container">
            <section>
                <!--Form-->
                <div class="row">
                    <div class=" col-md-7 col-md-offset-2">
                        <form id="reservationForm" class="form-horizontal" action="GuestReservation" method="GET" role="form">
                            <h1 class="modal-header">Reservation</h1>
                            <div class="modal-body">

                                <div class="form-group">
                                    <label for="checkinDate"class="col-sm-4 control-label">Check-in:</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="checkinDate" readonly class="form-control" name="checkinDate" value="<%=dateFormat.format(dateFrom)%>" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="checkoutDate"class="col-sm-4 control-label">Check-out:</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="checkoutDate"  readonly class="form-control" name="checkoutDate" value="<%=dateFormat.format(dateTo)%>">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="numberOfNight" class="col-sm-4 control-label">Night:</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="numberOfNight" readonly  class="form-control" name="numberOfNight">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="roomType" class="col-sm-4 control-label">Room Type:</label>
                                    <div class="col-sm-8">

                                        <label class="radio-inline"><input type="radio" name="roomType" id="roomType1" value="1">Premier Suite</label>
                                        <label class="radio-inline"><input type="radio" name="roomType" id="roomType2" value="2">Deluxe Suite</label>
                                        <label class="radio-inline"><input type="radio" name="roomType" id="roomType3" value="3">Luxury Suite</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="numberOfRoom" class="col-sm-4 control-label">Number of room:</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" id="numberOfRoom" name="numberOfRoom">
                                        </select>
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <a href="index.html" class="btn btn-default">Back</a>
                                <button type="submit" value="Submit" class="btn btn-primary">Submit</button>
                            </div>
                        </form>

                    </div>
                </div><!--/Form-->
            </section>
        </div>
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
        <script src="js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="js/formValidation.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>
            from = $("#checkinDate").val().split("/");
            f = new Date(from[2], from[1] - 1, from[0]);
            to = $("#checkoutDate").val().split("/");
            t = new Date(to[2], to[1] - 1, to[0]);

            var checkinDate = new Date(f);
            var checkoutDate = new Date(t);
            var timeDiff = Math.abs(checkoutDate.getTime() - checkinDate.getTime());
            var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));

            document.getElementById('numberOfNight').value = diffDays;

            var noroom = "Sorry, no room for this period";
            $("#roomType1").on("change", function () {
                var room = <%= roomNumber[0]%>
                if (room === 0) {
                    $("#numberOfRoom").attr("disabled", true);
                    $("#numberOfRoom").append('<option value="">' + noroom + '</option>');
                } else {
                    $("#numberOfRoom").removeAttr("disabled");
                    $("#numberOfRoom").find('option').remove();
                    for (i = 0; i < room; i++) {
                        $("#numberOfRoom").append('<option value="' + (i + 1) + '">' + (i + 1) + '</option>');
                    }
                }
            });
            $("#roomType2").on("change", function () {
                var room = <%= roomNumber[1]%>
                if (room === 0) {
                    $("#numberOfRoom").attr("disabled", true);
                    $("#numberOfRoom").append('<option value="">' + noroom + '</option>');
                } else {
                    $("#numberOfRoom").removeAttr("disabled");
                    $("#numberOfRoom").find('option').remove();
                    for (i = 0; i < room; i++) {
                        $("#numberOfRoom").append('<option value="' + (i + 1) + '">' + (i + 1) + '</option>');
                    }
                }
            });
            $("#roomType3").on("change", function () {
                var room = <%= roomNumber[2]%>
                if (room === 0) {
                    $("#numberOfRoom").attr("disabled", true);
                    $("#numberOfRoom").append('<option value="">' + noroom + '</option>');
                } else {
                    $("#numberOfRoom").removeAttr("disabled");
                    $("#numberOfRoom").find('option').remove();
                    for (i = 0; i < room; i++) {
                        $("#numberOfRoom").append('<option value="' + (i + 1) + '">' + (i + 1) + '</option>');
                    }
                }
            });


        </script>
    </body>
</html>
