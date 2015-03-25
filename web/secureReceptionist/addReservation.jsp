<%-- 
    Document   : addReservation
    Created on : Mar 25, 2015, 9:43:19 PM
    Author     : Kevin
--%>

<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entity.Booking"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% List<Booking> bookingPendingCheckin = (List<Booking>) session.getAttribute("bookingPendingCheckin");%>
        <div class="container">
            <section>
                <h1 class="page-header">Customer List</h1>
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <td>Name</td>
                            <td>Check-in Date</td>
                            <td>E-mail</td>
                            <td></td>              
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Booking bk : bookingPendingCheckin) {%>
                        <tr>
                            <td><%=bk.getCustomerId().getCustomername()%></td>
                            <td><%=new SimpleDateFormat("dd/MM/yyyy").format(bk.getDatefrom())%></td>
                            <td><%=bk.getCustomerId().getEmail()%></td>
                            <td style="text-align: left"> 
                                <% if (bk.getStatus().getId() == 2) { %>
                                <a href="#" class="btn btn-info">Check-Out</a>    
                                <%} else {%>
                                <a href="#" class="btn btn-primary">Check-in</a>
                                <a href="#" class="btn btn-danger">Cancel Reservation</a>
                                <%}%>
                            </td>
                        </tr>
                        <%}%>

                    </tbody>
                </table>
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
