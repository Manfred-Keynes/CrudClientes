<%-- 
    Document   : index
    Created on : 27/09/2021, 19:02:57
    Author     : mfer_
--%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Puesto"%>
<%@page import="java.util.HashMap"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
       
    </head>
    <body>
        <div>
            <h1>Mantenimiento de Clientes</h1>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal_clientes" onclick="function limpiar()">Nuevo Mantenimiento</button>  
        </div>
        

        <div class="container">
            <!-- Modal -->
<div class="modal fade" id="modal_clientes" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Clientes</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="sr_cliente" method="post" class="form-group">
            <label for="lbl_id"><b>Id</b></label>
            <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
            <label for="lbl_nit"><b>Nit</b></label>
            <input type="text" name="txt_nit" id="txt_nit" class="form-control" placeholder="Ejemplo: 123456">
            <label for="lbl_nombres"><b>Nombres</b></label>
            <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Nombre1 Nombre2">
            <label for="lbl_apellidos"><b>Apellidos</b></label>
            <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Apellido1 Apellido2">
            <label for="lbl_direccion"><b>Direccion</b></label>
            <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: #casa Ave zona">
            <label for="lbl_telefono"><b>Telefono</b></label>
            <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 58015779">
            <label for="lbl_fn"><b>Nacimiento</b></label>
            <input type="date" name="txt_fn" id="txt_fn" class="form-control" placeholder="yyyy-MM-dd">
            <br>
            <button  name= "btn_agregar" id="btn_agregar" value="agregar"class="btn btn-primary">Agregar</button>
            <button  name= "btn_modificar" id="btn_modificar" value="modificar"class="btn btn-warning">Modificar</button>
            <button  name= "btn_eliminar" id="btn_eliminar" value="eliminar"class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar el registro?'))return false">Eliminar</button>
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </form>
      </div>
      
    </div>
  </div>
</div>
            
            <br>
            <table class="table table-bordered">
    <thead>
      <tr>
        <th>Nit</th>
        <th>Nombres</th>
        <th>Apellidos</th>
        <th>Direccion</th>
        <th>Telefono</th>
        <th>Nacimiento</th>
      </tr>
    </thead>
    <tbody id="tbl_clientes">
     <%
        Cliente cliente = new Cliente();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = cliente.leer();
        for (int t = 0; t<tabla.getRowCount();t++){
            
            out.println("<tr data-id="+tabla.getValueAt(t, 0)+ ">");
            out.println("<td>" + tabla.getValueAt(t, 1)+"</td>");
            out.println("<td>" + tabla.getValueAt(t, 2)+"</td>");
            out.println("<td>" + tabla.getValueAt(t, 3)+"</td>");
            out.println("<td>" + tabla.getValueAt(t, 4)+"</td>");
            out.println("<td>" + tabla.getValueAt(t, 5)+"</td>");
            out.println("<td>" + tabla.getValueAt(t, 6)+"</td>");
          
            out.println("</tr>");
            }
        
        %>
    </tbody>
  </table>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script type="text/javascript">
            
            function limpiar(){
            $("#txt_id").val(0);
            $("#txt_nit").val('');
            $("#txt_nombres").val(''); 
            $("#txt_apellidos").val(''); 
            $("#txt_direccion").val(''); 
            $("#txt_telefono").val(''); 
            $("#txt_fn").val('');
            }
            $('#tbl_clientes').on('click','tr td',function(evt){
               var target,id,nit,nombres,apellidos,direccion,telefono,nacimiento;     
               target = $(event.target);
               id = target.parent().data('id');
               nit = target.parent("tr").find("td").eq(0).html();
               nombres = target.parent("tr").find("td").eq(1).html();
               apellidos = target.parent("tr").find("td").eq(2).html();
               direccion = target.parent("tr").find("td").eq(3).html();
               telefono = target.parent("tr").find("td").eq(4).html();
               nacimiento = target.parent("tr").find("td").eq(5).html();
               
            $("#txt_id").val(id);
            $("#txt_nit").val(nit);
            $("#txt_nombres").val(nombres); 
            $("#txt_apellidos").val(apellidos); 
            $("#txt_direccion").val(direccion); 
            $("#txt_telefono").val(telefono); 
            $("#txt_fn").val(nacimiento);
            $("#modal_clientes").modal('show');
            });
            
            
        </script>
    </body>
</html>
