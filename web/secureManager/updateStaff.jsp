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
        <jsp:useBean id="loginStaff" scope="session" class="Entity.Staff" />
        <%
            List< Staff> staffs = (List) session.getAttribute("allStaffList");
            String staffId = request.getParameter("id");
            Staff sta = new Staff();
            if (staffId != null) {

                for (int i = 0; i < staffs.size(); i++) {
                    if (Integer.parseInt(staffId) == staffs.get(i).getId()) {
                        sta = staffs.get(i);
                    }
                }
            }

            List<Task> taskList = (List) session.getAttribute("allTaskList");

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
                <h1 class="page-header"><%=request.getParameter("action")%> Staff</h1>





                <form id="manageStaffForm" action="../StaffControl"  class="form-horizontal" method="POST" role="form">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-1">

                            <div class="row">
                                <div class="col-sm-6 col-sm-offset-1">
                                    <span class="small red">Fill all field with <span class=" h4" >*</span></span>
                                </div>
                            </div>
                            <input hidden id="staffId" name="staffId" value="<%=sta.getId()%>">
                            <div class="form-group">
                                <label for="staffName" class="col-sm-4 control-label">Name<span class="red h4" > *</span></label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="staffName" name="staffName" value="<%=sta.getStaffname()%>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="staffIc" class="col-sm-4 control-label">IC<span class="red h4" > *</span></label>
                                <div class="col-sm-8">
                                    <input type="text" readonly class="form-control" id="staffIc" name="staffIc" value="<%=sta.getIc()%>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="phoneNumber" class="col-sm-4 control-label">Phone Number<span class="red h4" > *</span></label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="<%=sta.getPhonenumber()%>" maxlength="12">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="staffAddress" class="col-sm-4 control-label">Address<span class="red h4" > *</span></label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" id="staffAddress" name="staffAddress"><%=sta.getAddress()%></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="staffUsername" class="col-sm-4 control-label">User Name<span class="red h4" > *</span></label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="staffUsername" name="staffUsername" value="<%=sta.getUsername()%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="staffPassword" class="col-sm-4 control-label">New Password<span class="red h4" > *</span></label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="staffPassword" name="staffPassword" value="<%=sta.getPassword()%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="staffPasswordAgain" class="col-sm-4 control-label">Retype Password<span class="red h4" > *</span></label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="staffPasswordAgain" name="staffPasswordAgain" value="<%=sta.getPassword()%>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="task" class="col-sm-4 control-label">Task</label>
                                <div class="col-sm-8">

                                    <select class="form-control" name="task" id="task">
                                        <% for (int i = 0; i < taskList.size(); i++) {

                                                if (taskList.get(i).getTaskname().equalsIgnoreCase(sta.getTask().getTaskname())) {
                                        %>

                                        <option selected><%=taskList.get(i).getTaskname()%></option><%} else {%>
                                        <option><%=taskList.get(i).getTaskname()%></option><%}%>

                                        <%}%>
                                    </select>
                                </div>
                            </div>


                        </div>
                    </div>

                    <div class="modal-footer">
                        <%if (request.getParameter("action").equalsIgnoreCase("Delete")) {%>
                        <a href="roomMenu.jsp" class="btn btn-default">Back</a>
                        <button type="submit" id="submitbtn" class="btn btn-danger" value="Delete" name="action">Delete</button>
                        <%} else {%>
                        <a href="roomMenu.jsp" class="btn btn-default">Back</a>
                        <button type="reset"  id="resetbtn" class="btn btn-default" value="Reset"> Reset</button>
                        <button type="button" id="okbtn" class="btn btn-primary" >OK</button>
                        <button type="submit" id="submitbtn" class="btn btn-primary" value="Update" name="action">Update</button><%}%>
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
                var actionbtn = $("#submitbtn").val();
                if (actionbtn != "Delete") {
                    $("#submitbtn").hide();
                    $("#okbtn").click(function () {
                        $("#manageStaffForm input").attr('readonly', 'true');
                        $("#manageStaffForm textarea").attr('readonly', 'true');
                        $("#manageStaffForm select").attr('disabled', 'true');
                        alert("Please check the information is correct.");
                        $("#okbtn").hide();
                        $("#submitbtn").show();
                        $("html, body").animate({scrollTop: 100}, 100);
                    });
                    $("#resetbtn").click(function () {
                        $("#submitbtn").hide();
                        $("#okbtn").show();
                        $("#manageStaffForm input").removeAttr('readonly');
                        $("#manageStaffForm textarea").removeAttr('readonly');
                        $("#disabledInput").attr('readonly', true);
                        $("#manageStaffForm select").removeAttr('disabled');
                    });
                    $("#submitbtn").click(function () {
                        $("#submitbtn").hide();
                        $("#okbtn").show();
                        $("#manageStaffForm input").removeAttr('readonly');
                        $("#disabledInput").attr('readonly', true);
                        $("#manageStaffForm textarea").removeAttr('readonly');
                        $("#manageStaffForm select").removeAttr('disabled');
                    });
                } else {
                    $("#okbtn").hide();
                    $("#manageStaffForm input").attr('readonly', 'true');
                    $("#manageStaffForm textarea").attr('readonly', 'true');
                    $("#manageStaffForm select").attr('disabled', 'true');
                    $("#submitbtn").click(function () {
                        return  confirm("Are you sure wan to delete this staff?");
                        $("#manageStaffForm input").removeAttr('readonly');
                        $("#disabledInput").attr('readonly', true);
                        $("#manageStaffForm textarea").removeAttr('readonly');
                        $("#manageStaffForm select").removeAttr('disabled');
                    });
                }
            </script>
    </body>
</html>