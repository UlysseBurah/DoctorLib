<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html>
<html>
  <head>
    <link href="../assets/signIn.css" rel="stylesheet" type="text/css" />
    <link href="../assets/warning.css" rel="stylesheet" type="text/css" />

  </head>
  <body class = "body">
  
  <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/doctorlib"
         user = "root"  password = "130708"/>
         
  <sql:query dataSource = "${snapshot}" var = "logeduser">
SELECT email FROM doctorlib.logeduser ;     </sql:query>

<sql:query dataSource = "${snapshot}" var = "result">
SELECT firstname FROM doctorlib.patientdatabase WHERE email LIKE '${logeduser.rows[0].email}';     </sql:query>

<sql:query dataSource = "${snapshot}" var = "doctor">
SELECT firstname, lastname, email FROM doctorlib.doctordatabase;     </sql:query>
 
         
    <header>
    <h1>Welcome, ${result.rows[0].firstname}</h1>
    
    </header>
    <section>
      <div class="hero">
        <div class="background">
          <div class="signup" id="signup">
            <h1>Booking</h1>
            
            <form onSubmit="insert(); return false;" action="../BookingServlet" method="POST">
            
              <h5 id="bdate">Select the date of the rdv, ${result.rows[0].firstname} </h5>
              <div class="form-group-date">
                <input
                  type="date"
                  id="date"
                  name="date"
                  value="2020-07-10"
                  min="2020-07-07"
                  max="2020-12-31"
                />
              
                <span style="color: red" class="help-block"></span>
              </div>
              <div class="form-group">
              
                <label for="heure">Choose a time for your meeting:</label>

				<input 
					type="time" 
					id="heure" name="heure"
					min="09:00" max="18:00" required>
				
				<small>Office hours are 9am to 6pm</small>
                <span style="color: red" class="help-block"></span>
              </div>
              
              <label for="doctor-select">Choose a doctor:</label>

			
				<select name="doctorEmail" id="doctorEmail">
				    <option value="">--Please choose an option--</option>
				    <c:forEach var = "row" items = "${doctor.rows}">
				    
				    	<option value="${row.email}">${row.firstname} ${row.lastname}</option>
				    	
				    	
				    </c:forEach>
				</select>
            
              <div class="form-group">
                <input onclick="window.location.href = 'index.html';" type="submit" class="btn btn-primary" value="Book" />
              </div>
              <p>
                Already have a RDV ?<a href="rdvDisplay.jsp">My RDV</a>
              </p>
            </form>
          </div>
        </div>
      </div>
      <a class="logo" href="index.html" id="logo"
        ><img
          class="logo"
          src="../constants/images/pngfind.com-medical-png-832303.png"
      /></a>
    </section>
    <div class = "datas">
    <table id = "datasTable">
     </table>
  </body>
</html>
