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
						Producto producto = new Producto();
						String tablahtml = producto.consultarTodo();
						out.print(tablahtml);
						%>
					</div>
					<button type="button" class="btn-agregar-producto-pag" 
							onclick="window.location.href = 'nuevo_producto.jsp'">Agregar Producto</button>
				</div>
			</section>
			<jsp:include page="../aside/aside.html" />
			<div class="clearfix"></div>
		</div>
	</div>
	<jsp:include page="../footer/footer.html" />
</body>
</html>