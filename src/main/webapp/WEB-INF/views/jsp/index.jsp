<%@ include file="/WEB-INF/views/jsp/tags.jsp" %>
<%@ page import="java.io.*,java.util.*" %>

<!DOCTYPE html>
<html lang="en">
	<head>
	   <meta charset="utf-8">
	   <meta http-equiv="X-UA-Compatible" content="IE=edge">
	   <meta name="viewport" content="width=device-width, initial-scale=1">
	    
		<title>Spring MVC Template Project</title>
		<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon">
		<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon">
	    
	    <script src="http://www.geoplugin.net/javascript.gp"></script>
	</head>
	<body>
	
		<div class="container">
			<div class="page-header">
				<h1>Hello <%= request.getRemoteAddr() %>!</h1>
			</div>
			<h2>Server info</h2>
			<p class="lead">
				<b>Tomcat Version:</b> <%=application.getServerInfo()%>
				<br>
				<b>Servlet Specification Version:</b>
				<%=application.getMajorVersion()%>.<%=application.getMinorVersion()%>
				<br>
				<b>JSP version:</b>
				<%=JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion()%>
			</p>
			
			<h2>Request info</h2>
			<p class="lead">
				<%
					Enumeration<String> headerNames = request.getHeaderNames();
					while (headerNames.hasMoreElements()) {
						String paramName = (String) headerNames.nextElement();
						out.print("<b>" + paramName + ": </b>");
						String paramValue = request.getHeader(paramName);
						out.println(paramValue);
						out.println("</br>");
					}
				%>
			</p>
			<% String date = (String) application.getAttribute("date"); %>
			<p class="lead">Last visit was on <%= date %></p>
			
			<% application.setAttribute("date", new java.util.Date().toString()); %>					
		</div>

		<script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>	
	</body>
</html>