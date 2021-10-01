/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author mfer_
 */
public class Conexion {
   public Connection conexionDB;
   public final String bd = "empresa";
   public final String puerto = "3306";
   public final String urlConexion = String.format("jdbc:mysql://localhost:%s/%s",puerto,bd);
   public final String usuario = "root";
   public final String contra = "515919";
   public final String jdbc = "com.mysql.cj.jdbc.Driver";
   
   public void abrir_conexion(){
   try{
       Class.forName(jdbc);
       conexionDB = DriverManager.getConnection(urlConexion,usuario,contra);
       System.out.println("conexion exitosa");
   }catch(ClassNotFoundException | SQLException ex){
       System.out.println("Error" + ex.getMessage());
   }
   }
   
   public void cerrar_conexion(){
       try{
       conexionDB.close();
       }catch(SQLException ex){
       System.out.println("Error" + ex.getMessage());
       }
   }
    
}
