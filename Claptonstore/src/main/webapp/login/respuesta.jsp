<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int per = Integer.parseInt(request.getParameter("txtPer"));
	String nombre = request.getParameter("txtNombre");
	String dir=request.getParameter("txtDir");
	String usuario=request.getParameter("txtUsuario");
    String clave=request.getParameter("txtPswd");
    
    Usuario user = new Usuario();
    /*String res=user.ingresarUsuario(per, nombre, dir, usuario, clave);
    out.print(res);*/
	%>
</body>
</html>