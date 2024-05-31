<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.productos.seguridad.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String em = request.getParameter("txtEmail");
	String ca = request.getParameter("txtPswdA");
	String cn=request.getParameter("txtPswd");
	String cc=request.getParameter("txtPswdN");
    
    Usuario user = new Usuario();
    boolean res=user.CambiarClave(cc, em);
    out.print(res);
	%>
</body>
</html>