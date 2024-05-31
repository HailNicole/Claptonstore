<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" import="com.productos.negocio.*" import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
						<form name="listadoProductos" action="carrito.jsp">
						<% Producto producto=new Producto();
						 String tabla=producto.consultarProductos();
						 out.print(tabla);
						%>
						<p>
						<input type="submit" name="button" id="button" value="Enviar"/>
						</p>
						</form>
					</div>
						<h2>Mi carrito</h2>
						<img src="../imagenes/carrito.png" width="100" height="100" alt="carrito de compras" />
						
						<ul>
						<%
						List<String> listaElementos=(List<String>)session.getAttribute("carrito");
						List<Double> listaPrecios=(List<Double>)session.getAttribute("carrito2");

						if(listaElementos == null)
						{
						listaElementos =new ArrayList<String>();
						listaPrecios= new ArrayList<Double> ();
						session.setAttribute("carrito", listaElementos);
						session.setAttribute("carrito2", listaPrecios);
						}
						
					    String[] elementos = request.getParameterValues("productos");
					    if (elementos != null) {
					        for (String elemento : elementos) {
					            String nombre_producto = producto.devolver_nombre(elemento);
					            listaElementos.add(nombre_producto);
					        }
					    }
					    if (elementos != null) {
					        for (String elemento : elementos) {
					            Double precio_producto = producto.devolver_precio(elemento);
					            listaPrecios.add(precio_producto);
					        }
					    }
					 				
					    Map<String, Integer> contadorElementos = new HashMap<>();
					    for (String a : listaElementos) {
					        if (contadorElementos.containsKey(a)) {
					            contadorElementos.put(a, contadorElementos.get(a) + 1);
					        } else {
					            contadorElementos.put(a, 1);
					        }
					    }
					
					    for (Map.Entry<String, Integer> entry : contadorElementos.entrySet()) {
					        String productos = entry.getKey();
					        int cantidad = entry.getValue();
					        out.println("<li>" + productos + (cantidad > 1 ? " x" + cantidad : "") + "</li>");
					    }
					    
					    String mensaje = null;
					    if(listaPrecios!=null){
					        Double total = 0.00;
					        for (Double data : listaPrecios) {
					        	if(data!=null){
					        		total += data; 
					        	}
					        }
					        mensaje = "Total a pagar: " + total + " dólares";
					    }
					    %>
						</ul>
						
						<button onclick="showHiddenInput()">Pagar</button>
						<p id="hiddenMessage" style="display:none;"><%= mensaje %></p>
						
						<script>
						document.getElementById('hiddenInput').style.display='none';

							function showHiddenInput(){
							    document.getElementById('hiddenMessage').style.display='block';
							} 
						</script>
				</div>
			</section>
			<jsp:include page="../aside/aside.html" />
			<div class="clearfix"></div>
		</div>
	</div>
	<jsp:include page="../footer/footer.html" />
</body>
</html>