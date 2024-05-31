<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Claptons Music Store</title>
<link rel="stylesheet" type="text/css" href="../estilos/categoria.css">
</head>
<body>

	<jsp:include page="../header/header.html" />
	<div id="contenido">
		<div class="agrupar">
			<section class="seccion">
				<div class="contenedor-section">
					<h1>BUSCAR CATEGORIA</h1>
					<div class="contenido-categoria">
						<form action = "reporte_producto_categoria.jsp" method = "post">
							<label for="cmbCategoria"><b>Busca una Categoría</b></label>
								<%
							        Categoria cat = new Categoria();
									String combohtml = cat.mostrarCategoria();
									out.print(combohtml);
							    %>
							<input type="submit" value="Buscar"/>
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