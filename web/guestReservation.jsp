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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Guest Reservation</title>

    </head>
    <body>
        <%@include file="navbar.html" %>

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

                    <form id="guestReserveForm" action="GuestReservation"  class="form-horizontal" method="POST" role="form">
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



                            <div class="col-md-5">
                                <h4 class="modal-header">Payment Detail</h4>

                                <div class="form-group">
                                    <label for="totalpayment" class="col-sm-3 control-label">Total Amount (RM)</label>          
                                    <div class="col-sm-9">
                                        <input class="form-control" id="disabledInput" type="text" readonly value="<%=newBooking.getNeedtopay()%>">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="cardHolderName" class="col-sm-3 control-label">Cardholder's Name<span class="h4 red"> *</span></label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="cardHolderName" name="cardHolderName" placeholder="Jane Doe" maxlength="20">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="card" class="col-sm-3 control-label">Card Type</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>Visa</option>
                                            <option>MasterCard</option>
                                            <option>American Express</option>
                                            <option>Discover</option>                           
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="creditCardNumber" class="col-sm-3 control-label">Card Number<span class="h4 red"> *</span></label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="creditCardNumber" name="creditCardNumber" placeholder="1234567890" maxlength="11">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="cvv" class="col-sm-3 control-label">CVV<span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span> <span class="h4 red"> *</span> </label>  
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="cvv" name="cvv" placeholder="1234" maxlength="4">

                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="expdate" class="col-sm-3 control-label">Expiry Date<span class="h4 red"> *</span></label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="expdate" name="expdate" placeholder="12/20">
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
        <script src="js/jquery_1.11.2_jquery.min.js" type="text/javascript"></script>
        <script src="js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="js/formValidation.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js"></script>
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