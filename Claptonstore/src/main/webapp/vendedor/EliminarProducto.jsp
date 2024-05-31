<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Claptons Music Store</title>
</head>
<body>
	<%
		int cod=Integer.parseInt(request.getParameter("cod"));
		Producto mp = new Producto();
		boolean f = mp.EliminarProducto(cod);
		if(f==true){
			response.sendRedirect("buscar_productos_categoria.jsp");
		}
	%>
</body>
</html>