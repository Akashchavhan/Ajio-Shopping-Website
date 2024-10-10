<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajio Website</title>
</head>
<body>
  <%@ include file="./IncludeHeader.jsp" %>
  <%@ include file="./IncludeDirectiveMain.jsp" %>
  <%@ include file="./IncludeDirectiveFooter.jsp" %>
  <%
     response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
     response.setHeader("Pragma", "no-cache");
     response.setDateHeader("Expires", 0);
   %>
</body>
</html>