<%@include file="db.jsp" %>
<% String iemail = (String) session.getAttribute("institute_email"); %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="login.css" rel="stylesheet">

    <title>E-Coach</title>
</head>

<body>
    <!-- navbar -->
    <container>
        <div class="containerx">

            <nav class="navbar navbar-expand-lg navbar-light bg-light " id="fix">

                <div class="container-fluid">
                    <img src="download.jpg" style="border-radius: 90% ; margin-left: 1%; margin-right: 1%;  "
                        height="3%" width="4%" alt="">
                    <a class="navbar-brand" href="index.html">E-Coach</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false"
                        aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="index.html"></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#"></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled"></a>
                            </li>
                        </ul>
                        <h9 style="margin-right:1% ; color: brown;"><%= iemail%></h9>
                       
                           <a href="logout"> <button class="btn btn-outline-success"
                                style="background-color: rgb(61, 222, 236);margin-right: 1rem; "
                                >Logout</button> </a>
                       
                    </div>
                </div>
            </nav>


        </div>
    </container>

    <container>
        <h1>Login</h1>
        <div class="col">
            <div class="row" style="height: 5rem; text-align: center; ">
                <div class="list-group list-group-horizontal" id="list-tab" role="tablist">
                    <h3 class="list-group-item  active a"
                        style=" border-bottom-left-radius: 95%; border-bottom-right-radius: 95%; width: 50%; left: 27%;">
                        Batches</h3>
                </div>
            </div>
            <div class="col-8" style="text-align: center; position: relative; margin: auto; align-self: center; ">
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active">
                        <container class="d-flex" style="text-align: center; margin: auto;">
                            <div class="parallax container  " style="margin-top: 10%;   ">

                                <div class="card" style="width: 60rem; ">

                                    <div class="card-body">
                                    
                                    <% 

int course_id = Integer.parseInt( request.getParameter("course_id") );

String qr = "select * from batches where course_id = " + course_id + ";";

Statement s = con.createStatement();

ResultSet rs = s.executeQuery(qr);




while(rs.next())
{
	
	%>
                                        
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Batch Id</th>
                                                        <th scope="col">Trainer Id</th>
                                                        <th scope="col">Course Id</th>
                                                        <th scope="col">Batch Timing</th>
                                                        <th scope="col">Batch Start Date</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td><%=rs.getString("batch_id") %></td>
	<td><%=rs.getString("trainer_id") %></td>
	<td><%=rs.getString("trainer_id") %></td>
	<td><%=rs.getString("batch_timing") %></td>
	<td><%=rs.getString("batch_start_date") %></td>

                                                    </tr>

                                                </tbody>
                                                
                                                   <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Student Id</th>
                                                        <th scope="col">Student First Name</th>
                                                        <th scope="col">Student Last Name</th>
                                                        <th scope="col">Student Email</th>
                                                        
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <% 
		
		
		
		//String qr2 = "select * from students where student_id = any(select student_id from studentbatches where batch_id = " + temp + ") ;";
		String temp = rs.getString("batch_id");
		
		String qr2 = "select * from students where student_id = any(select student_id from studentbatches where batch_id = " + temp + " ) ;" ;
		
		
		Statement s2 = con.createStatement();
		
		ResultSet rs2 = s2.executeQuery(qr2);
		
		
		while(rs2.next())
		{
		%>
		<tr>
		<td><%=rs2.getString("student_id") %></td>
		<td><%=rs2.getString("student_first_name") %></td>
		<td><%=rs2.getString("student_last_name") %></td>
		<td><%=rs2.getString("student_email") %></td>
		</tr>
		
		<%
		}
		%>

                                                </tbody>
                                            </table>
                                            
                                            <hr style="height: 5px; border: 5px solid red	;">
                                            <br>    
                                                
                                                <%
	
	
}



%>
                                            </table>
                                            
                                         


                                        
                                    </div>
                                </div>

                            </div>

                        </container>
                    </div>

                </div>

            </div>

    </container>
    </div>
    </div>
    </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

    <!-- footer -->
   <!--   <container class="footerhome2" style="left: 0;">

        <footer class="footerhome2">
            <footer class="py-3 my-4">

                <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                    <li class="nav-item"><a href="index.html" class="nav-link px-2 text-muted">Home</a></li>
                    <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Features</a></li>
                    <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Pricing</a></li>
                    <li class="nav-item"><a href="faq.html" class="nav-link px-2 text-muted">FAQs</a></li>
                    <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
                </ul>
                <p class="text-center text-muted">� 2021 E-Coach, Inc</p>

            </footer>
        </footer>
    </container>
    -->
</body>

</html>