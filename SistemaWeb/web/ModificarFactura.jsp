<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Modificar Factura</title>
    <!-- Aquí puedes incluir tus estilos, enlaces a hojas de estilo, scripts, etc. -->
</head>

<body>
    <div class="container">
        <h2>Modificar Factura</h2>
        <c:if test="${exito != null}">
            <c:if test="${exito}">
                <p><strong style="color: darkgreen;">La información se modificó correctamente</strong></p>
            </c:if>
            <c:if test="${!exito}">
                <p><strong style="color: red;">No se modificó la información</strong></p>
            </c:if>
        </c:if>

        <h1>Detalles de la Factura</h1>

        <!-- Formulario para modificar la factura -->
        <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=ModificarFactura">
            <!-- Campo oculto para el ID de la venta -->
            <input type="hidden" id="id_venta" name="id_venta" value="${param.id_venta}" required>
             <!-- Campo oculto para la fecha de venta -->
             <label>Fecha Venta:</label>
             <input type="date" id="fechaVenta" name="fechaVenta" value="${param.fechaVenta}" required><br>

            <!-- Campos del formulario para modificar la factura -->
            <label for="ID_Producto">ID Producto:</label>
            <input type="number" id="ID_Producto" name="ID_Producto" value="${param.ID_Producto}" required><br>

            <label for="cantidadProducto">Cantidad de Producto:</label>
            <input type="number" id="cantidadProducto" name="cantidadProducto" value="${param.cantidadProducto}" required><br>

            <!-- Campos adicionales para Facturas -->
            <label for="iva">IVA:</label>
            <input type="number" id="iva" name="iva" step="0.01" value="${param.iva}" required><br>

            <label for="descuento">Descuento:</label>
            <input type="number" id="descuento" name="descuento" step="0.01" value="${param.descuento}" required><br>

            <!-- Campos calculados automáticamente -->
            <label for="subtotal">Subtotal:</label>
            <input type="text" id="subtotal" name="subtotal" value="${param.subTotal}" readonly><br>

            <label for="total">Total:</label>
            <input type="text" id="total" name="total" value="${param.total}" readonly><br>

            <label for="nit">NIT:</label>
            <input type="text" id="nit" name="nit" value="${param.nit}" required><br>

            <!-- Campo para seleccionar el cliente -->
            <label for="idCliente">ID Cliente:</label>
            <input type="text" id="idCliente" name="idCliente" value="${param.ID_Cliente}" required><br>

            <button type="submit">Guardar Cambios</button>
        </form>
    </div>

    <a href="/SistemaWeb/ServletPrincipal?accion=GestionVentas">Regresar a Gestion Ventas</a>
</body>

</html>
