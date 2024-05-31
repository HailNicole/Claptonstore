<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Claptons Music Store</title>
<link rel="stylesheet" type="text/css" href="../estilos/loginn.css">
</head>
<body>
	<jsp:include page="../header/header.html" />
	<div id="contenido">
		<div class="agrupar">
			<section class="seccion">
				<div class="contenedor-section">
					<h1>INICIO DE SESIÓN</h1>
					<%
						String error = request.getParameter("error");
						if (error != null) {
						%>
						    <div class="error-message">
						        <%= error %>
						    </div>
						<%
						}
					%>
					<div class="contenedor-form">
						<form action="../login/verificar_login.jsp" method="post">
							<div class="div1">
								<input type="text" name="txtUser" placeholder="Usuario" required />
								<input type="password" name="txtPswd" 
									placeholder="Contraseña" required/>
							</div>
							<div class="div2">
								<input type="submit" value="Ingresar"/>
								<input type="reset" value="Reestablecer"/>
								<div class="ref-crear-cuenta">
								<a href="registro.jsp">Crear Cuenta</a>
								<a href="registro.jsp">¿Olvidó su contraseña?</a></div>
							</div>
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