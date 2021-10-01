/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author mfer_
 */
public class Cliente extends Persona {
    private String nit;
    Conexion cn;

    public Cliente(){}
    public Cliente(String nit, int id, String nombres, String apellidos, String direccion, String telefono, String fecha_nacimiento) {
        super(id, nombres, apellidos, direccion, telefono, fecha_nacimiento);
        this.nit = nit;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

   
    public DefaultTableModel leer(){
        DefaultTableModel tabla = new DefaultTableModel();
        try{
            cn = new Conexion();
            String query = "SELECT id_cliente as id,nit,nombre,apellido,direccion,telefono,fecha_nacimiento FROM empresa.clientes;";
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionDB.createStatement().executeQuery(query);
            String encabezado [] = {"id","nit","nombres","apellidos","direccion","telefono","nacimiento"};
            tabla.setColumnIdentifiers(encabezado);
            String datos [] = new String [7];
            while(consulta.next()){
                datos [0] = consulta.getString("id");
                datos [1] = consulta.getString("nit");
                datos [2] = consulta.getString("nombre");
                datos [3] = consulta.getString("apellido");
                datos [4] = consulta.getString("direccion");
                datos [5] = consulta.getString("telefono");
                datos [6] = consulta.getString("fecha_nacimiento");
                tabla.addRow(datos);
                
            }
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println("Error" + ex.getMessage());
        }
        return tabla;
    }
    
    @Override
    public int agregar(){
    int retorno = 0;
    try{
        PreparedStatement parametro;
        String query;
            cn = new Conexion();
            cn.abrir_conexion();
            query = "INSERT INTO empresa.clientes(nit,nombre,apellido,direccion,telefono,fecha_nacimiento)VALUES(?,?,?,?,?,?);";
            
            parametro = (PreparedStatement) cn.conexionDB.prepareStatement(query);
            parametro.setString(1, getNit());
            parametro.setString(2, getNombres());
            parametro.setString(3, getApellidos());
            parametro.setString(4, getDireccion());
            parametro.setString(5, getTelefono());
            parametro.setString(6, getFecha_nacimiento());
            
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
    }catch(SQLException ex){
        System.out.println("Error" + ex.getMessage());
    }
    return retorno;
    }
    
    @Override
    public int modificar(){
        int retorno = 0;
    try{
        PreparedStatement parametro;
        String query;
            cn = new Conexion();
            cn.abrir_conexion();
            query = "update empresa.clientes set nit=?,nombre=?,apellido=?,direccion=?,telefono=?,fecha_nacimiento=? where id_cliente=?;";
            
            parametro = (PreparedStatement) cn.conexionDB.prepareStatement(query);
            parametro.setString(1, getNit());
            parametro.setString(2, getNombres());
            parametro.setString(3, getApellidos());
            parametro.setString(4, getDireccion());
            parametro.setString(5, getTelefono());
            parametro.setString(6, getFecha_nacimiento());
            parametro.setInt(7, getId());
            
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
    }catch(SQLException ex){
        System.out.println("Error" + ex.getMessage());
    }
    return retorno;
    }
    
    @Override
    public int eliminar(){
        int retorno = 0;
    try{
        PreparedStatement parametro;
        String query;
            cn = new Conexion();
            cn.abrir_conexion();
            query = "delete from  empresa.clientes where id_cliente=?;";
            
            parametro = (PreparedStatement) cn.conexionDB.prepareStatement(query);
            parametro.setInt(1, getId());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
    }catch(SQLException ex){
        System.out.println("Error" + ex.getMessage());
    }
    return retorno;
    }
}
