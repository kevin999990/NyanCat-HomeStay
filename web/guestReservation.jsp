<%-- 
    Document   : guestReservation
    Created on : Mar 21, 2015, 9:51:52 PM
    Author     : Kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="newBooking" scope="session" class="Entity.Booking" />
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
                <div class="row">
                    <h1 class="page-header"> Guest Reservation </h1>
                    <form id="guestReserveForm" class="form-horizontal" method="POST" role="form">

                        <div class="row">
                            <div class="col-md-10 col-md-offset-1">
                                Show the room details and date
                            </div>
                        </div>
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
                                    <label for="totalpayment" class="col-sm-3 control-label">Total Amount </label>          
                                    <div class="col-sm-9">
                                        <input class="form-control" id="disabledInput" type="text" placeholder="MYR 300" disabled>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="cardname" class="col-sm-3 control-label">Cardholder's Name</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="cardname" placeholder="Jane Doe" maxlength="20">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="card" class="col-sm-3 control-label">Card Type</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>American Express</option>
                                            <option>MasterCard</option>
                                            <option>Visa</option>
                                            <option>Discover</option>                           
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cardno" class="col-sm-3 control-label">Card Number</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="cardno" placeholder="1234567890" maxlength="11">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="cvv" class="col-sm-3 control-label">CVV  <span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span></label>  
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="cvv" placeholder="1234" maxlength="4">

                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="expdate" class="col-sm-3 control-label">Expiry Date</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="expdate" placeholder="12/20">
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="modal-footer">
                            <input type="reset"  class="btn btn-default" value="Reset"> 
                            <input type="submit" class="btn btn-primary" value="Submit"> 
                        </div>

                    </form>
                </div>

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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>