<%-- 
    Document   : guestReservation
    Created on : Mar 21, 2015, 9:51:52 PM
    Author     : Kevin
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="Entity.Booking"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% List<Booking> newBooking = (List<Booking>) session.getAttribute("newBooking");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="navbar.html" %>

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
                    <a class="navbar-brand" href="index.html">NyanCat HomeStay</a>
                </div>

                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-left">
                        <li class="active"><a href="index.html">Home</a></li>
                    </ul>

                </div><!-- .nav-collapse-->
            </div>
        </div><!-- Navigation Bar End Here-->
        <!--BODY-->

        <div class="container">
            <section>

                <!-- Reservation Form -->
                <div class="row">
                    <h1 class="page-header"> Guest Reservation </h1>
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
                                    <% for (int i = 0; i < newBooking.size(); i++) {%>
                                    <tr>
                                        <td><%= i + 1%></td>
                                        <td><%= new SimpleDateFormat("dd/MM/yyyy").format(newBooking.get(i).getDatefrom())%></td>
                                        <td><%= new SimpleDateFormat("dd/MM/yyyy").format(newBooking.get(i).getDateto())%></td>
                                        <td><%= session.getAttribute("numberOfNight")%></td>
                                        <td><%= newBooking.get(i).getRoomId().getRoomtype().getDescription()%></td>
                                        <td><%= newBooking.get(i).getRoomId().getRoomtype().getPrice()%></td>
                                        <td><%= Integer.parseInt(session.getAttribute("numberOfNight").toString()) * newBooking.get(i).getRoomId().getRoomtype().getPrice()%></td>
                                    </tr>
                                    <% }%>
                                    <tr> 
                                        <td colspan="6"  >Grand Total:</td>
                                        <td ><%= newBooking.get(0).getNeedtopay()%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div><!--/Room detail-->

                    <form id="guestReserveForm" action="GuestReservation"  class="form-horizontal" method="POST" role="form">
                        <div class="row">
                            <div class="col-md-5 col-md-offset-1">

                                <h4 class="modal-header">Personal Detail</h4>

                                <div class="form-group">
                                    <label for="customerName" class="col-sm-3 control-label">Name</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="customerName" name="customerName" placeholder="Jane Doe">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="email" class="col-sm-3 control-label">Email</label>
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
                                    <label for="address" class="col-sm-3 control-label">Address</label>   
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
                                        <input class="form-control" id="disabledInput" type="text" readonly value="<%=newBooking.get(0).getNeedtopay()%>">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="cardHolderName" class="col-sm-3 control-label">Cardholder's Name</label>
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
                                    <label for="creditCardNumber" class="col-sm-3 control-label">Card Number</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="creditCardNumber" name="creditCardNumber" placeholder="1234567890" maxlength="11">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="cvv" class="col-sm-3 control-label">CVV  <span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span></label>  
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="cvv" name="cvv" placeholder="1234" maxlength="4">

                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="expdate" class="col-sm-3 control-label">Expiry Date</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="expdate" name="expdate" placeholder="12/20">
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="modal-footer">
                            <input type="reset"  class="btn btn-default" value="Reset"> 
                            <input type="submit" class="btn btn-primary" value="Submit"> 
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
</html>