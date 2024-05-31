<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Claptons Music Store</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<jsp:include page="../header/header.html" />
	<jsp:include page="../login/menu.jsp" />
	<div id="contenido">
		<div class="agrupar">
			<section class="seccion">
				<div class="contenedor-section">
						<%
							int cod=Integer.parseInt(request.getParameter("cod"));
							Producto mp = new Producto();
							mp.ConsulEditarProductos(cod);
						%>
					<h1>Editar Producto</h1>
					<div class="contenedor-form">
						<form action="editar_producto.jsp" method="post">
							<table>
								<tr>
									<td>Codigo Producto</td>
									<td><input type = "text" name="editarcod" value="<%=mp.getId_pr()%>"></td>
								</tr>
								<tr>
									<td>Categoria</td>
									<td><output><%=mp.getId_cat()%></output></td>
								</tr>
								<tr>
									<td>Descripcion</td>
									<td><input type = "text" name="editardes" value="<%=mp.getNombre_pr()%>"/></td>
								</tr>
								<tr>
									<td>Precio</td>
									<td><input type = "text" name="editarprecio" value="<%=mp.getPrecio_pr()%>"/></td>
								</tr>
								<tr>
									<td>Cantidad</td>
									<td><input type = "text" name="editarcant" value="<%=mp.getCantidad_pr()%>"/></td>
								</tr>
							</table>
							<br/>
							<br/><input type="submit" value="Actualizar"/>
						</form>
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