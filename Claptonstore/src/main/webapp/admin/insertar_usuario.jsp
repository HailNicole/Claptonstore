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
	String nombre = request.getParameter("txtNombre");
	String correo=request.getParameter("txtEmail");
	int per= Integer.parseInt(request.getParameter("cmbPerfil"));
    
    Usuario user = new Usuario();
    String res=user.ingresarUsuario(per, nombre, correo, "654321");
    out.print(res);
	%>
</body>
</html>