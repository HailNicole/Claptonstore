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
					<h1>REGISTRATE</h1>
					<div class="contenedor-form">
						<form action="insertar_usuario.jsp" method="post">
							<div class="div1">
								<ul>
								<li><h4>Perfil</h4> <input type="number" name="txtPer" required />*</li>
								<li><h4>Nombre</h4> <input type="text" name="txtNombre" required />*</li>
								<li><h4>Cedula</h4> <input type="text" name="txtCedula" maxlength="10" required/>*</li>
								<li><h4>Direccion</h4> <input type="text" name="txtDir" required />*</li>
								
								<li><h4>Usuario</h4> <input type="text" name="txtUsuario" required />*
								<li><h4>Correo Electrónico</h4> <input type="email" name="txtEmail" placeholder="usuario@nombreProveedor.dominio" required/></li>
							  	<li><h4>Contraseña</h4> <input type="password" name="txtPswd" required/>*</li>
							  	<li><h4>Confirmar Contraseña</h4> <input type="password" name="txtPswdC" required/>*</li>


								<li><h4>Estado Civil</h4>
							      <select name="cmbECivil">
									<option value="Soltero">Soltero</option>
									<option value="Casado">Casado</option>
									<option value="Divorciado">Divorciado</option>
								  </select></li>

									<li><h4>Lugar Residencia</h4>
									<input type="radio" name="rdResidencia" value="Sur" required/>Sur
									<input type="radio" name="rdResidencia" value="Norte" required/>Norte
									<input type="radio" name="rdResidencia" value="Centro" required/>Centro
									</li>
									<li><h4>Mes de Nacimiento</h4> <input type="month" name="fecha" required/></li>

									<li><h4>Foto</h4>
							      	<input type="file" name="fileFoto" accept=".jpg, .jpeg, .png"/></li>

									<li><h4>Color</h4>
								    <input type="color" value="#ff0000" /></li>
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