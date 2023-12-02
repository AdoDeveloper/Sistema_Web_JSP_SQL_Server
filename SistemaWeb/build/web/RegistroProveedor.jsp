<%-- 
    Document   : RegistroEmpleados
    Created on : 12 oct 2023, 16:45:13
    Author     : ernes
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Proveedor</title>
    </head>
    <body>
        <c:if test="${exito!=null}">
            <c:if test="${exito}">
                <p><strong style="color: darkgreen;">La información se guardó correctamente</strong></p>
            </c:if>
            <c:if test="${!exito}">
                <p><strong style="color: red;">No se guardó la información</strong></p>
            </c:if>
        </c:if>   
        <h1>Agregar nuevo proveedor</h1>
            
        <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=RegistroProveedor">


                <!-- El ID de los empleados es autoincrementable -->
                <label>ID_Proveedor:</label>
                <input type="text" name="ID_Proveedor" id="ID_Proveedor" required /><br>
                <label>Nombre:</label>
                <input type="text" name="nombreProveedor" id="nombreProveedor" required /><br>
                <label>Telefono:</label>
                <input type="text" name="telefonoProveedor" id="telefonoProveedor" required /><br>
                <label>ID_Direccion:</label>
                <input type="text" name="ID_Direccion" id="ID_Direccion" required /><br>
               
                
                       
                <label>Dirección:</label>
                <select name="ID_Direccion" id="ID_Direccion" required>
                    <option value="-1" selected>Seleccione una opción</option>
                    <c:forEach var="item" items="${listaDirecciones}">
                        <option value="${item.ID_Direccion}">
                            ${item.linea1}, ${item.linea2}, ${item.ID_Distrito}, ${item.codigoPostal}
                        </option>
                    </c:forEach>
                </select>                              
                <button type="button" onclick="agregarDireccion()">Pre-registrar dirección</button>
                
                
                
                <br>
                <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar el proveedor?')" />
                <input type="button" value="Limpiar" onclick="limpiarFormulario()" />
                <button type="button" onclick="location.href = '/SistemaWeb/?accion=GestionProveedores'">Gestionar proveedor</button> 
        </form>
    </body>
</html>
<script>
  

    function agregarDireccion() {
        window.open('/SistemaWeb/?accion=AgregarDireccion', '_blank', 'width=600, height=600, top=100, left=100, resizable=yes, scrollbars=yes');
    }

    function limpiarFormulario() {
        document.getElementById("ID_Proveedor").value = "";
        document.getElementById("nombreProveedor").value = "";
        document.getElementById("telefonoProveedor").value = "";

        document.getElementById("ID_Direccion").value = "-1";
    }
</script>
