<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Claptons Music Store</title>
<link rel="stylesheet" type="text/css" href="../estilos/consulta.css">
</head>
<body>
	<jsp:include page="../header/header.html" />
	<jsp:include page="../login/menu.jsp" />
	<div id="contenido">
		<div class="agrupar">
			<section class="seccion">
				<div class="contenedor-section">
					<h1>CONSULTAR PRODUCTOS</h1>
					<div class="contenido-consulta">
						<%
							int cod = Integer.parseInt(request.getParameter("editarcod"));
							String des = request.getParameter("editardes");
							double pre = Double.parseDouble(request.getParameter("editarprecio"));
							int can= Integer.parseInt(request.getParameter("editarcant"));
							
						Producto mp = new Producto(cod,des,pre,can);
						
						boolean actualizado = mp.ModificarProducto(mp);
						if(actualizado==true){
							response.sendRedirect("buscar_productos_categoria.jsp");
						}else{
							out.println("algo salio mal");
						}
						%>
					</div>
				</div>
			</section>
			<jsp:include page="../aside/aside.html" />
			<div class="clearfix"></div>
		</div>
	</div>
	<jsp:include page="../footer/footer.html" />
</body>
</html>