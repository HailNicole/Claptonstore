package com.productos.seguridad;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.productos.datos.Conexion;
import com.productos.negocio.Producto;

public class Usuario {
	private String nombre, direccion,login,clave;
	private int perfil;
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

	public int getPerfil() {
		return perfil;
	}

	public void setPerfil(int perfil) {
		this.perfil = perfil;
	}

	public boolean verificarUsuario(String nlogin, String nclave)
	{
	boolean respuesta=false;
	String sentencia= "Select * from tb_usuarios where correo_us='"+nlogin+
	"' and clave_us='"+nclave+"';";
	try
	{
	ResultSet rs;
	Conexion clsCon=new Conexion();
	rs=clsCon.Consulta(sentencia);
	if(rs.next())
	{
	respuesta=true;
	this.setLogin(nlogin);
	this.setClave(nclave);
	this.setPerfil(rs.getInt(2));
	this.setNombre(rs.getString(3));
	}
	else
	{
	respuesta=false;
	rs.close();
	}
	}
	catch(Exception ex)
	{
	System.out.println( ex.getMessage());
	}
	return respuesta;
	}
	
	public String ingresarUsuario(int per,String nombre,String correo,String clave){
	Conexion con=new Conexion();
	PreparedStatement pr=null;
	String result="";
	String sql="INSERT INTO tb_usuarios(id_per, nombre_us, correo_us, clave_us)"
			+ "	VALUES (?, ?, ?, ?);";
	 try{
	 pr=con.getConexion().prepareStatement(sql);
	 pr.setInt(1, per);
	 pr.setString(2, nombre);
	 pr.setString(3, correo);
	 pr.setString(4, clave);

	 if(pr.executeUpdate()==1)
	 {
	 result="Insercion correcta";
	 }
	 else
	 {
	 result="Error en insercion";
	 }
	 }
	catch(Exception ex){
	 result=ex.getMessage();
	 System.out.print(result);
	 }
	 finally
	 {
	 try
	 {
	 pr.close();
	 con.getConexion().close();
	 }
	 catch(Exception ex)
	 {
	 System.out.print(ex.getMessage());
	 }
	 }
	 return result;
	 } 

	
	public boolean CambiarClave(String claven, String em) {
		boolean agregado=false;
		Conexion con=new Conexion();
		String sql ="UPDATE tb_usuarios SET clave_us='" + claven + "' WHERE \"correo_us\"='" + em + "'";
			
		try {
			con.Ejecutar(sql);
			agregado=true;
			
		}catch(Exception e) {
			agregado=false;
		}
		return agregado;
	}
}