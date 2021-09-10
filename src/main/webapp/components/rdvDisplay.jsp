<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
 
<html>
   <head>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
      <title>YOUR RDV</title>
      <style>
     <%@ include file="../assets/doctorRdv.css"%>
	</style>
   </head>

   <body class= "body">
   	<div class="background">
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/doctorlib"
         user = "root"  password = "130708"/>
         
         
    <sql:query dataSource = "${snapshot}" var = "logeduser">
SELECT email FROM doctorlib.logeduser ;     </sql:query>      
 
      <sql:query dataSource = "${snapshot}" var = "result">
SELECT patientEmail, doctorEmail, date, heure FROM doctorlib.rdv WHERE patientEmail LIKE '${logeduser.rows[0].email}';     </sql:query>
 
 	<h1>Your RDV</h1>
 	<h1> </h1>
 	
 	<br>
 	<br>
 	
 	<div class="table-wrapper">
 	
      <table class="fl-table"  width = "100%">
         <tr>
            <th>Your email</th>
            <th>Doctor's email</th>
            <th>Date of the rdv</th>
            <th>Hour of the rdv</th>
         </tr>
        <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.patientEmail}"/>
               </td><td><c:out value = "${row.doctorEmail}"/></td>
               <td><c:out value = "${row.date}"/></td>
               <td><c:out value = "${row.heure}"/></td>
            </tr>
         </c:forEach>
      </table>
      </div>
      
      
        
 	</div>
   </body>
</html>