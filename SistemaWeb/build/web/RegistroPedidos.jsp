<%-- 
    Document   : RegistroPedidos
    Created on : 1 dic 2023, 01:29:54
    Author     : gabri
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Pedido</title>
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
        <h1>Agregar un nuevo Pedido</h1>
        <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=RegistroPedido">

            <!-- El ID de los pedidos es autoincrementable -->
            <label>Fecha Pedido:</label>
            <input type="date" id="fechaPedido" name="fechaPedido" value="<%= new java.sql.Date(System.currentTimeMillis()) %>" required><br>        
            <label>Monto:</label>
            <input type="text" name="monto" id="monto" required /><br>
            <label>Cantidad:</label>
            <input type="number" name="cantidad" id="cantidad" required /><br>
            <label>Producto:</label>
            <select name="ID_Producto" id="ID_Producto" required>
                <option value="-1" selected>Seleccione una opción</option>
                <c:forEach var="item" items="${listaProductos}">
                    <option value="${item.ID_Producto}">
                        ${item.nombreProducto}
                    </option>
                </c:forEach>
            </select>          
            <button type="button" onclick="agregarProducto()">Nuevo Producto</button><br>   
            <label>Proveedor:</label>
            <select name="ID_Proveedor" id="ID_Proveedor" required>
                <option value="-1" selected>Seleccione una opción</option>
                <c:forEach var="item" items="${listaProveedores}">
                    <option value="${item.ID_Proveedor}">
                        ${item.nombreProveedor}
                    </option>
                </c:forEach>
            </select>          
            <button type="button" onclick="agregarProveedor()">Nuevo Proveedor</button><br> 
             <br>
            <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar el pedido?')" />
            <input type="button" value="Limpiar" onclick="limpiarFormulario()" />
            <button type="button" onclick="location.href = '/SistemaWeb/?accion=GestionPedidos'">Gestionar pedidos</button> 
        </form>
    </body>
</html>
<script>
    function agregarProveedor() {
        window.open('RegistroProveedores.jsp', '_blank', 'width=600, height=600, top=100, left=100, resizable=yes, scrollbars=yes');
    }

    function agregarDireccion() {
        window.open('RegistroDirecciones.jsp', '_blank', 'width=600, height=600, top=100, left=100, resizable=yes, scrollbars=yes');
    }
    
    function agregarProducto() {
        window.open('RegistroProductos.jsp', '_blank', 'width=600, height=600, top=100, left=100, resizable=yes, scrollbars=yes');
    }

  function limpiarFormulario() {
    document.getElementById("fechaPedido").value = "";
    document.getElementById("monto").value = "";
    document.getElementById("ID_Proveedor").value = "";
    document.getElementById("cantidad").value = "";
    document.getElementById("ID_Producto").value = "";
}
</script>

