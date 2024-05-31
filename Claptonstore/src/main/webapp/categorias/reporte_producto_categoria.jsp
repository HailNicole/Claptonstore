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
					<div class="contenido-categoria">
						<%
						String idCategoria = request.getParameter("cmbCategoria");
						if(idCategoria != null && !idCategoria.isEmpty()){
							Producto producto = new Producto();
							int categoriaId = Integer.parseInt(idCategoria);
							String tablahtml = producto.buscarProductoCategoriaTodos(categoriaId);
							out.print(tablahtml);
						}else{
							out.print("No hay productos de esa categoría");
						}
						%>
						<button type="button" class="btn-noticia1"
						onclick="window.location.href = 'buscar_por_categoria.jsp'">
						Regresar</button>
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