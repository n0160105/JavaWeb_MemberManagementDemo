<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.javaguides.usermanagement.web.Counter" %>
<%
	Counter CountFileHandler=new Counter();
	int count =0;
	if(application.getAttribute("count")==null){
		count=CountFileHandler.readFile(request.getRealPath("/")+"count.txt");
		application.setAttribute("count",new Integer(count));
	}
	count=(Integer)application.getAttribute("count");
	if(session.isNew()) ++count;
	application.setAttribute("count",count);
	CountFileHandler.writeFile(request.getRealPath("/")+"count.txt",count);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
	<link rel="stylesheet" href="style.css">
</head>

<body>
<form action="LoginServlet" method="post" class="login-form">
	<h1>User manage system</h1>
	<p> 你是第&nbsp;<%=count %>&nbsp;位訪客</p>
	<div class="txtb">Username:<input type="text" name="name" value=${name} ></div>
	<br>
	<div class="txtb">Password:<input type="password" name="password" value=${password} ></div>
	<br>
	<div style="width: 100px;height: 60px;" class="txtb">Vertify：
	<input id="Text3" type="text" class="txtCode" name="vertify_input"/></div>
	<div><canvas id="canvas" width="140" height="60"></canvas></div>
	<input type="hidden" name="vertify" id="code" />
	<div class="login-button"><input type="submit" value="Login"></div>
	<div class="bottom-text"><a href="forget.html">Forget Password</a>&nbsp;&nbsp;&nbsp;
		<a href="memberRegister.jsp">Register</a></div><br>
</form>
</body>
<script>
	var code = " ";
	drawPic();
	document.getElementById("code").value=code;

	function randomNum(min,max)	{
		return Math.floor( Math.random()*(max-min)+min);
	}
	
	function randomColor(min,max)	{
		var r = randomNum(min,max);
		var g = randomNum(min,max);
		var b = randomNum(min,max);
		return "rgb("+r+","+g+","+b+")";
	}
	
	function drawPic()
	{
		var canvas=document.getElementById("canvas");
		var width=canvas.width;
		var height=canvas.height;
		var ctx = canvas.getContext('2d');
		ctx.textBaseline = 'bottom';
		ctx.fillStyle = randomColor(200,240);
		ctx.fillRect(0,0,width,height);
		var str = 'ABCEFGHJKLMNPQRSTWXY123456789';
		code = ""
		for(var i=0; i<4; i++)
		{
			var txt = str[randomNum(0,str.length)];
			code += txt;
			ctx.fillStyle = randomColor(50,160);
			ctx.font = randomNum(15,30)+'px SimHei';
			var x = 10+i*25;
			var y = randomNum(25,35);
			var deg = randomNum(-45, 45);
			ctx.translate(x,y);
			ctx.rotate(deg*Math.PI/180);
			ctx.fillText(txt, 0,0);
			ctx.rotate(-deg*Math.PI/180);
			ctx.translate(-x,-y);
		}
		for(var i=0; i<2; i++)
		{
			ctx.strokeStyle = randomColor(40,180);
			ctx.beginPath();
			ctx.moveTo( randomNum(0,width), randomNum(0,height) );
			ctx.lineTo( randomNum(0,width), randomNum(0,height) );
			ctx.stroke();
		}
		for(var i=0; i<50; i++)
		{
			ctx.fillStyle = randomColor(0,255);
			ctx.beginPath();
			ctx.arc(randomNum(0,width),randomNum(0,height), 1, 0, 2*Math.PI);
			ctx.fill();
		}
	}
</script>
</html>