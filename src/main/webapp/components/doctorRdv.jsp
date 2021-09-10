<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

 
<html>
   <head>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <!-- <link href="../assets/doctorRdv.css" rel="stylesheet" type="text/css" /> -->
   <style>
     <%@ include file="../assets/doctorRdv.css"%>
	</style>
   
      <title>YOUR RDV</title>
   </head>

   <body class= "body">
   	<div class="background">
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/doctorlib"
         user = "root"  password = "130708"/>
         
         
    <sql:query dataSource = "${snapshot}" var = "logeduser">
SELECT email FROM doctorlib.logeduser ;     </sql:query>      
 
      <sql:query dataSource = "${snapshot}" var = "result">
SELECT ID, patientEmail, doctorEmail, date, heure FROM doctorlib.rdv WHERE doctorEmail LIKE '${logeduser.rows[0].email}';     </sql:query>

		<sql:query dataSource = "${snapshot}" var = "doctor">
SELECT firstname, lastname, email FROM doctorlib.doctordatabase WHERE email LIKE '${logeduser.rows[0].email}';     </sql:query>
 
 	<h1>Your RDV, ${doctor.rows[0].firstname} ${doctor.rows[0].lastname}</h1>
 	<h1> </h1>
 	<br>
 	<br>
 	
 	<div class="table-wrapper">
 	
      <table class="fl-table"  width = "100%">
         <tr>
         	<th>ID of the rdv</th>
            <th>Patient Email</th>
            <th>Your Email</th>
            <th>Date of the rdv</th>
            <th>Hour of the rdv</th>
         </tr>
        <c:forEach var = "row" items = "${result.rows}">
            <tr>
            	<td><c:out value = "${row.ID}"/></td>
               <td><c:out value = "${row.patientEmail}"/></td>
               <td><c:out value = "${row.doctorEmail}"/></td>
               <td><c:out value = "${row.date}"/></td>
               <td><c:out value = "${row.heure}"/></td>
            </tr>
         </c:forEach>
      </table>
      </div>
      <br>
      <form class="delete" action="../DeleteServlet" method="POST">
  		<input type="text" placeholder="ID of the rdv..." name="delete">
  		<button type="submit" name="delete"  >Delete</button>
	  </form>
        
 </div>
   </body>
</html>