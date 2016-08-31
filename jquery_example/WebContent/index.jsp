<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="cp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>jQuery_example</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/jquery.treeview.css"/>
<script type="text/javascript" src="${cp }/resources/js/jquery.js"></script>
<script type="text/javascript" src="${cp }/resources/js/jquery.treeview.js"></script>
</head>
<body>
	<ol>
		<li>
			<a href="${cp }/treeview/exam01.jsp">jQuery.treeview</a>
		</li>
	</ol>
</body>
</html>