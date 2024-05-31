<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Claptons Music Store</title>
<link rel="stylesheet" type="text/css" href="../estilos/registro.css">
</head>
<body>
	<jsp:include page="../header/header.html" />
	<div id="contenido">
		<div class="agrupar">
			<section class="seccion">
				<div class="contenedor-section">
					<h1>Cambiar Clave</h1>
					<div class="contenedor-form">
						<form action="cambiar_pswd.jsp" method="post">
							<div class="div1">
								<ul>
								<li><h4>Correo Electronico</h4> <input type="text" name="txtEmail" required/>*</li>
								<li><h4>Contraseña Anterior</h4> <input type="text" name="txtPswdA" required/>*</li>
							  	<li><h4>Contraseña</h4> <input type="password" name="txtPswd" required/>*</li>
							  	<li><h4>Confirmar Contraseña</h4> <input type="password" name="txtPswdN" required/>*</li>
								</ul>

							</div>
							    <input type="submit" value="Enviar"/>
							    <input type="reset" value="Reestablecer"/>
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