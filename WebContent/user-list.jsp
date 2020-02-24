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
	<form action="LogoutServlet" class="listForm">
    <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>List of Users</h2></caption>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Password</th>
                <th>Email</th>
                <th>Country</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="user" items="${listUser}">
                <tr>
                    <td><c:out value="${user.id}" /></td>
                    <td><c:out value="${user.name}" /></td>
                    <td><c:out value="${user.password}" /></td>
                    <td><c:out value="${user.email}" /></td>
                    <td><c:out value="${user.country}" /></td>                 
                    <td>
                    	<a href="edit?id=<c:out value='${user.id}' />"><img src="images/edit.png" width=20 height=20></a>
                    	&nbsp;&nbsp;&nbsp;&nbsp;
                    	<a href="delete?id=<c:out value='${user.id}' />"><img src="images/delete.png" width=20 height=20></a>                    	
                    </td>
                </tr>
            </c:forEach>
        </table>
        	<br>
        	<input type="submit" value="Logout" class="a_demo_four">
        </form>
    </div>	
</body>

<script src='//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js'></script>
<style>
table{background:white;border-collapse:collapse;margin:1.25em 0 0;width:60%}
table tr,table th,table td{border:none;border-bottom:1px solid #e4ebeb;font-family:'Lato',sans-serif;font-size:1rem}
table th,table td{padding:10px 12px;text-align:left}
table th{background:#56a2cf;color:#ffffff;text-transform:uppercase}
table tr td{background:#eaf3f5;color:#999999}
table tr:nth-of-type(2n+2) td{background:#ffffff}
table.bt tfoot th,table.bt tfoot td,table.bt tbody td{font-size:12px;padding:0}
table.bt tfoot th:before,table.bt tfoot td:before,table.bt tbody td:before{background:#56a2cf;color:white;margin-right:10px;padding:2px 10px}
table.bt tfoot th .bt-content,table.bt tfoot td .bt-content,table.bt tbody td .bt-content{display:inline-block;padding:2px 5px}
table.bt tfoot th:first-of-type:before,table.bt tfoot th:first-of-type .bt-content,table.bt tfoot td:first-of-type:before,table.bt tfoot td:first-of-type .bt-content,table.bt tbody td:first-of-type:before,table.bt tbody td:first-of-type .bt-content{padding-top:10px}
table.bt tfoot th:last-of-type:before,table.bt tfoot th:last-of-type .bt-content,table.bt tfoot td:last-of-type:before,table.bt tfoot td:last-of-type .bt-content,table.bt tbody td:last-of-type:before,table.bt tbody td:last-of-type .bt-content{padding-bottom:10px}
table.bt thead,table.bt tbody th{display:none}
table.bt tfoot th,table.bt tfoot td,table.bt tbody td{border:none;display:block;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;vertical-align:top;float:left\9;width:100%\9}
table.bt tfoot th::before,table.bt tfoot td::before,table.bt tbody td::before{content:attr(data-th) ":";display:inline-block;-webkit-flex-shrink:0;-ms-flex-shrink:0;flex-shrink:0;font-weight:bold;width:6.5em}
table.bt tfoot th.bt-hide,table.bt tfoot td.bt-hide,table.bt tbody td.bt-hide{display:none}
table.bt tfoot th .bt-content,table.bt tfoot td .bt-content,table.bt tbody td .bt-content{vertical-align:top}
.bt-wrapper.active{max-height:310px;overflow:auto;-webkit-overflow-scrolling:touch}
</style>

<script>
//<![CDATA[
(function($){$.fn.basictable=function(options){var setup=function(table,data){var headings=[];if(data.tableWrap){table.wrap('<div class="bt-wrapper"></div>')}var format="";if(table.find("thead tr th").length){format="thead th"}else if(table.find("tbody tr th").length){format="tbody tr th"}else if(table.find("th").length){format="tr:first th"}else{format="tr:first td"}$.each(table.find(format),function(){var $heading=$(this);var colspan=parseInt($heading.attr("colspan"),10)||1;var row=$heading.closest("tr").index();if(!headings[row]){headings[row]=[]}for(var i=0;i<colspan;i++){headings[row].push($heading)}});$.each(table.find("tbody tr"),function(){setupRow($(this),headings,data)});$.each(table.find("tfoot tr"),function(){setupRow($(this),headings,data)})};var setupRow=function($row,headings,data){$row.children().each(function(){var $cell=$(this);if(($cell.html()===""||$cell.html()==="&nbsp;")&&!data.showEmptyCells){$cell.addClass("bt-hide")}else{var cellIndex=$cell.index();var headingText="";for(var j=0;j<headings.length;j++){if(j!=0){headingText+=": "}var $heading=headings[j][cellIndex];headingText+=$heading.text()}$cell.attr("data-th",headingText);if(data.contentWrap&&!$cell.children().hasClass("bt-content")){$cell.wrapInner('<span class="bt-content" />')}}})};var unwrap=function(table){$.each(table.find("td"),function(){var $cell=$(this);var content=$cell.children(".bt-content").html();$cell.html(content)})};var check=function(table,data){if(!data.forceResponsive){if(table.removeClass("bt").outerWidth()>table.parent().width()){start(table,data)}else{end(table,data)}}else{if(data.breakpoint!==null&&$(window).width()<=data.breakpoint||data.containerBreakpoint!==null&&table.parent().width()<=data.containerBreakpoint){start(table,data)}else{end(table,data)}}};var start=function(table,data){table.addClass("bt");if(data.tableWrap){table.parent(".bt-wrapper").addClass("active")}};var end=function(table,data){table.removeClass("bt");if(data.tableWrap){table.parent(".bt-wrapper").removeClass("active")}};var destroy=function(table,data){table.find("td").removeAttr("data-th");if(data.tableWrap){table.unwrap()}if(data.contentWrap){unwrap(table)}table.removeData("basictable")};var resize=function(table){if(table.data("basictable")){check(table,table.data("basictable"))}};this.each(function(){var table=$(this);if(table.length===0||table.data("basictable")){if(table.data("basictable")){if(options=="destroy"){destroy(table,table.data("basictable"))}else if(options==="start"){start(table,table.data("basictable"))}else if(options==="stop"){end(table,table.data("basictable"))}else{check(table,table.data("basictable"))}}return false}var settings=$.extend({},$.fn.basictable.defaults,options);var vars={breakpoint:settings.breakpoint,containerBreakpoint:settings.containerBreakpoint,contentWrap:settings.contentWrap,forceResponsive:settings.forceResponsive,noResize:settings.noResize,tableWrap:settings.tableWrap,showEmptyCells:settings.showEmptyCells};if(vars.breakpoint===null&&vars.containerBreakpoint===null){vars.breakpoint=568}table.data("basictable",vars);setup(table,table.data("basictable"));if(!vars.noResize){check(table,table.data("basictable"));$(window).bind("resize.basictable",function(){resize(table)})}})};$.fn.basictable.defaults={breakpoint:null,containerBreakpoint:null,contentWrap:true,forceResponsive:true,noResize:false,tableWrap:false,showEmptyCells:false}})(jQuery);
//]]>
</script>
<script>
$("#ListTable").basictable();
</script>
</html>
