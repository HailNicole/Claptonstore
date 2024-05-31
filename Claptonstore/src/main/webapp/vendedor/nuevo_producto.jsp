<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Claptons Music Store</title>
<link rel="stylesheet" type="text/css" href="../estilos/categoria.css">
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<jsp:include page="../header/header.html" />
	<jsp:include page="../login/menu.jsp" />
	<div id="contenido">
		<div class="agrupar">
			<section class="seccion">
				<div class="contenedor-section">
					<h1>Registro de Productos</h1>
					<div class="contenedor-form">
						<form action="resultado_registro_prod.jsp" method="post">
							<ul>
								 <li>
									<label for="cmbCategoria"><b>Categoría</b></label>
										<%
										  Categoria cat = new Categoria();
										  String combohtml = cat.mostrarCategoria();
										  out.print(combohtml);
										%> </br>
								</li>
								<li>
									<label for="txtNombre"><b>Nombre del Producto</b></label>
										<input type="text" name="txtNombre" placeholder="Nombre" required />* </br>
								</li>
								<li>
									<label for="txtCantidad"><b>Cantidad</b></label>
										<input type="number" name="txtCantidad" placeholder="Cantidad del Producto" required />* </br>
								</li>
								<li>
									<label for="txtPrecio"><b>Precio</b></label>
										<input type="number" name="txtPrecio" placeholder="Precio del Producto" required />* </br>
								</li>
								<li>
									<label for="FotoProducto"><b>Imagen Producto</b></label>
										<input type="file" id="filepicker" name="FotoProducto" accept="image/*" />
										<ul id="listing"></ul>										
								</li>
								<li>
									    <input type="submit" value="Enviar"/>
									    <input type="reset" value="Reestablecer"/>
								</li>
							</ul>
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