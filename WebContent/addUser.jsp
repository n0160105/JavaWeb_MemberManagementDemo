<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>User Management Application</title>
	<link rel="stylesheet" href="style2.css">
</head>
<body>
	<center>
		<h1>User Management</h1>
        <h2>
        	<img src="images/add.png" width=30 height=30>
        	<a href="addUser.jsp">Add New User</a>
        	&nbsp;&nbsp;&nbsp;
        	<img src="images/listicon.png" width=30 height=30>
        	<a href="list">List All Users</a>
        	
        </h2>
	</center>
	</center>
    <div align="center">
        <!--<c:if test="${user == null}">
			
        </c:if>-->
        <form action="addUserServlet" method="post" class="memberListForm">
        <table border="1" cellpadding="5">
            <caption>
            	<h2>
            		<c:if test="${user == null}">
            			Member Register
            		</c:if>
            	</h2>
            </caption>
        		<c:if test="${user != null}">
        			<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
        		</c:if>            
            <tr>
                <th>Username: </th>
                <td>
                	<input type="text" name="name" size="45"
                			value="<c:out value='${user.name}' />"
                		/>
                </td>
            </tr>
            <tr>
                <th>Password: </th>
                <td>
                	<input type="password" name="password" size="45"
                			value="<c:out value='${user.password}' />"
                		/>
                </td>
            </tr>
            <tr>
                <th>Email: </th>
                <td>
                	<input type="text" name="email" size="45"
                			value="<c:out value='${user.email}' />"
                	/>
                </td>
            </tr>
            <tr>
                <th>Country: </th>
                <td>
                	<input type="text" name="country" size="15"
                			value="<c:out value='${user.country}' />"
                	/>
                </td>
            </tr>          		
        </table>
        <input type="submit" value="Save" class="a_demo_four"/>
        </form>
    </div>	
</body>
</html>
