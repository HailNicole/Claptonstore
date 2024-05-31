<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" import="com.productos.seguridad.*"%>
<%
String usuario;
HttpSession sesion = request.getSession();
 if (sesion.getAttribute("txtUser") == null) //Se verifica si existe la variable 
 {
 %>
 <jsp:forward page="login.jsp">
 <jsp:param name="error" value="Debe registrarse en el sistema."/>
 </jsp:forward>
 <%
 }
 else
 {
 usuario=(String)sesion.getAttribute("txtUser"); //Se devuelve los valores de atributos
 int perfil=(Integer)sesion.getAttribute("perfil");
 %>
<h1>Sitio Privado de Productos</h1>
<h4>Bienvenido
<%
out.println(usuario);
%>
</h4>
<%
Pagina pag=new Pagina();
String menu=pag.mostrarMenu(perfil);
out.print(menu);
}
%>
