<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" import="com.productos.negocio.*"%>
    <%@ page import="java.io.File" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Claptons Music Store</title>
</head>
<body>
	<jsp:include page="../header/header.html" />
	<jsp:include page="../login/menu.jsp" />
	<div id="contenido">
		<div class="agrupar">
			<section class="seccion">
				<div class="contenedor-section">
					<h1>Registro de Productos</h1>
					<div class="contenedor-form">
						<%
						String dir = null;
						    String categoria = request.getParameter("cmbCategoria");
							String nombre = request.getParameter("txtNombre");
							String cantidad = request.getParameter("txtCantidad");
							String precio = request.getParameter("txtPrecio");
							String foto_producto = request.getParameter("FotoProducto");
							
							  String[] archivosSelecionados = request.getParameterValues("FotoProducto");
							  if (archivosSelecionados != null) {
							    for (String archivo : archivosSelecionados) {
							      File file = new File(archivo);
							      String filePath = "C:\\Users\\Public\\Pictures\\";
							      dir =  filePath+file.getName();
							    }
							  } else {
							    out.println("No se ha seleccionado ningún archivo.");
							  }	  
							  
							int categoriaInt = Integer.parseInt(categoria);
							int cantidadInt = Integer.parseInt(cantidad);
							double precioInt = Double.parseDouble(precio);
							
						%>
						<%
							Producto producto = new Producto();
							String resultado = producto.ingresarProducto(categoriaInt, nombre, cantidadInt, precioInt, dir);
							out.print(resultado);
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