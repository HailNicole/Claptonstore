package com.productos.negocio;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import com.productos.datos.Conexion;

public class Producto {
	private int id_pr, id_cat, cantidad_pr;
	private String nombre_pr;
	private double precio_pr;
	
	public int getId_pr() {
		return id_pr;
	}

	public void setId_pr(int id_pr) {
		this.id_pr = id_pr;
	}

	public int getId_cat() {
		return id_cat;
	}

	public void setId_cat(int id_cat) {
		this.id_cat = id_cat;
	}

	public int getCantidad_pr() {
		return cantidad_pr;
	}

	public void setCantidad_pr(int cantidad_pr) {
		this.cantidad_pr = cantidad_pr;
	}

	public String getNombre_pr() {
		return nombre_pr;
	}

	public void setNombre_pr(String nombre_pr) {
		this.nombre_pr = nombre_pr;
	}

	public Double getPrecio_pr() {
		return precio_pr;
	}

	public void setPrecio_pr(double d) {
		this.precio_pr = d;
	}

	public String consultarTodo()
	{
		String sql="SELECT * FROM tb_productos ORDER BY id_pr";
		Conexion con=new Conexion();
		String tabla="<table border=2><th>ID</th><th>Producto</th><th>Cantidad</th><th>Precio</th>";
		ResultSet rs=null;
		rs=con.Consulta(sql);
		try {
		while(rs.next())
		{
			tabla+="<tr><td>"+rs.getInt(1)+"</td>"
			+ "<td>"+rs.getString(3)+"</td>"
			+ "<td>"+rs.getInt(4)+"</td>"
			+ "<td>"+rs.getDouble(5)+"</td>"
			+ "</td></tr>";
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		tabla+="</table>";
		return tabla;
	}
	
	public String buscarProductoCategoria(int cat)
	{
		String sentencia="SELECT id_pr, id_cat, nombre_pr, cantidad_pr, precio_pr FROM tb_productos WHERE id_cat="+cat;
		Conexion con=new Conexion();
		ResultSet rs=null;
		String resultado="<table border=3><th>ID</th><th>Producto</th><th>Cantidad</th><th>Precio</th>";
		try
		{
		rs=con.Consulta(sentencia);
		while(rs.next())
		{
			resultado+="<tr><td>"+rs.getInt(1)+"</td>"
					+ "<td>"+rs.getString(3)+"</td>"
					+ "<td>"+rs.getInt(4)+"</td>"
					+ "<td>"+rs.getDouble(5)+"</td>"
					+ "<td> <a href= BuscarProducto.jsp?cod=" + rs.getInt(1) + "><pre style=\"text-align:center\">Modificar</pre></a></td>"
					+ "<td> <a href= EliminarProducto.jsp?cod=" + rs.getInt(1) + " \"><pre style=\"textalign: center\">Eliminar</pre></a></td>"
					+ "</td></tr>";
		}
		resultado+="</table>";
		}
		catch(SQLException e)
		{
		System.out.print(e.getMessage());
		}
		System.out.print(resultado);
		return resultado;
	}
	
	public String buscarProductoCategoriaTodos(int cat)
	{
		String sentencia="SELECT id_pr, id_cat, nombre_pr, cantidad_pr, precio_pr FROM tb_productos WHERE id_cat="+cat;
		Conexion con=new Conexion();
		ResultSet rs=null;
		String resultado="<table border=3><th>ID</th><th>Producto</th><th>Cantidad</th><th>Precio</th>";
		try
		{
		rs=con.Consulta(sentencia);
		while(rs.next())
		{
			resultado+="<tr><td>"+rs.getInt(1)+"</td>"
					+ "<td>"+rs.getString(3)+"</td>"
					+ "<td>"+rs.getInt(4)+"</td>"
					+ "<td>"+rs.getDouble(5)+"</td>"
					+ "</td></tr>";
		}
		resultado+="</table>";
		}
		catch(SQLException e)
		{
		System.out.print(e.getMessage());
		}
		System.out.print(resultado);
		return resultado;
	}
	
	public String ingresarProducto(int cat,String nombre, int cantidad, double precio,
			String directorio){
			String result="";
			Conexion con=new Conexion();
			PreparedStatement pr=null;
			String sql="INSERT INTO tb_productos (id_cat,"
					+ "nombre_pr,cantidad_pr,precio_pr,foto_pr) "
					+ "VALUES(?,?,?,?,?)";
					try{
					pr=con.getConexion().prepareStatement(sql);
					pr.setInt(1,cat);
					pr.setString(2, nombre);
					pr.setInt(3, cantidad);
					pr.setDouble(4, precio);
					File fichero=new File(directorio);
					FileInputStream streamEntrada=new FileInputStream(fichero);
					pr.setBinaryStream(5, streamEntrada,(int)fichero.length());
					System.out.print(streamEntrada);
					if(pr.executeUpdate()==1)
					{
					result="Inserción correcta";
					}
					else
					{
					result="Error en inserción";
					}
					}
					catch(Exception ex)
					{
					result=ex.getMessage();
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
	
	public String mostrarProducto(int cod){
			String result="";
			Conexion con=new Conexion();
			PreparedStatement pr=null;
			ResultSet rs=null;
			String resultt = null;
			String sql="SELECT foto_pr FROM tb_productos where id_pr = '" + 52 + "'";
			try {
				rs=con.Consulta(sql);
				while(rs.next()) {
					InputStream is = rs.getBinaryStream("foto_pr");
			        ByteArrayOutputStream baos = new ByteArrayOutputStream();
			        byte[] buffer = new byte[1024];
			        int bytesRead;
			        while ((bytesRead = is.read(buffer)) != -1) {
			          baos.write(buffer, 0, bytesRead);
			        }
			        byte[] imageBytes = baos.toByteArray();
			        String base64Image = Base64.getEncoder().encodeToString(imageBytes);

			        // Mostrar la imagen en la página
			        resultt = "<img src='data:image/jpeg;base64," + base64Image + "' alt='Imagen de la base de datos'>";
				}
			}catch(Exception e) {
				
			}
			return resultt;
	}
	
	public void ConsulEditarProductos(int cod) {
		Conexion con=new Conexion();
		ResultSet rs=null;
		String sql = "SELECT id_pr,id_cat,nombre_pr, precio_pr, cantidad_pr FROM tb_productos where id_pr = '" + cod + "'";
		
		try {
			rs=con.Consulta(sql);
			while(rs.next()) {
				setId_pr(rs.getInt(1));
				setId_cat(rs.getInt(2));
				setNombre_pr(rs.getString(3));
				setPrecio_pr(rs.getDouble(4));
				setCantidad_pr(rs.getInt(5));
			}
		}catch(Exception e) {
			
		}
	}
	
	public boolean ModificarProducto(Producto mp) {
		boolean agregado=false;
		Conexion con=new Conexion();
		String sql ="UPDATE tb_productos SET nombre_pr='" + mp.getNombre_pr() + "', precio_pr= '" + mp.getPrecio_pr() + 
				"', " + "cantidad_pr= '" + mp.getCantidad_pr() + "' WHERE \"id_pr\"='" + mp.getId_pr() + "'";
			
		try {
			con.Ejecutar(sql);
			agregado=true;
			
		}catch(Exception e) {
			agregado=false;
		}
		return agregado;
	}
	
	public boolean EliminarProducto(int cod) {
		boolean f = false;
		Conexion con=new Conexion();
		String sql = "delete from tb_productos where id_pr ='" + cod + "'";
		try {
			con.Ejecutar(sql);
			f=true;
			
		}catch(Exception e) {
			f=false;
		}
		return f;
	}

	public Producto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Producto(int id_pr, String nombre_pr, double precio_pr, int cantidad_pr) {
		super();
		this.id_pr = id_pr;
		this.cantidad_pr = cantidad_pr;
		this.nombre_pr = nombre_pr;
		this.precio_pr = precio_pr;
	}
	
	public String consultarProductos()
	{
	String sql="SELECT * FROM tb_productos GROUP BY id_pr";
	Conexion con=new Conexion();
	String tabla="<table class=table table-striped><th>Producto</th><th>Precio</th><th>Añadir al carrito</th>";
	ResultSet rs=null;
	rs=con.Consulta(sql);
	try {
	while(rs.next())
	{
	tabla+="<tr><td>"+rs.getString(3)+"</td>" + "<td>"+rs.getString(5)+"</td>" 
	+ "<td><input type=checkbox name=productos value="+rs.getString(1)+"></td>" + "</tr>";
	}
	} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	System.out.print(e.getMessage());
	}
	tabla+="</table>";
	return tabla;
	}
	
	public String devolver_nombre(String id) {
		String sql="SELECT nombre_pr FROM tb_productos where id_pr=" + " \' " + id + "\' ";
		String nombre = null;
		Conexion con=new Conexion();
		ResultSet rs=null;
		try {
			rs=con.Consulta(sql);
			while(rs.next()) {
				nombre = rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		return nombre;
	}
	
	public Double devolver_precio(String id) {
		String sql="SELECT precio_pr FROM tb_productos where id_pr=" + " \' " + id + "\' ";
		Double precio = null;
		Conexion con=new Conexion();
		ResultSet rs=null;
		try {
			rs=con.Consulta(sql);
			while(rs.next()) {
				precio = rs.getDouble(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		return precio;
	}
	
	public Double total(String id) {
		String sql="SELECT precio_pr FROM tb_productos where id_pr=" + " \' " + id + "\' ";
		Double precio = null;
		Conexion con=new Conexion();
		ResultSet rs=null;
		try {
			rs=con.Consulta(sql);
			while(rs.next()) {
				precio = rs.getDouble(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		return precio;
	}
}