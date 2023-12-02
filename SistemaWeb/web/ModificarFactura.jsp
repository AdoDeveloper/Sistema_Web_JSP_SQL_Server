<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Modificar Factura</title>
    <!-- Enlaces a Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <!-- Tus estilos personalizados pueden ir aquí -->
</head>

<body>
    <div class="container mt-5">
        <h2 class="mb-4">Modificar Factura</h2>
        <c:if test="${exito != null}">
            <c:if test="${exito}">
                <p class="alert alert-success"><strong>La información se modificó correctamente</strong></p>
            </c:if>
            <c:if test="${!exito}">
                <p class="alert alert-danger"><strong>No se modificó la información</strong></p>
            </c:if>
        </c:if>

        <h1 class="mb-3">Detalles de la Factura</h1>

        <!-- Formulario para modificar la factura -->
        <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=ModificarFactura">
            <div class="mb-3">
                <!-- Campo para la fecha de venta -->
                <label for="fechaVenta" class="form-label">Fecha de Venta:</label>
                <input type="date" class="form-control" id="fechaVenta" name="fechaVenta" value="${param.fechaVenta}" required>
            </div>

            <div class="mb-3">
                <!-- Campo para el ID del Producto -->
                <label for="ID_Producto" class="form-label">ID Producto:</label>
                <input type="number" class="form-control" id="ID_Producto" name="ID_Producto" value="${param.ID_Producto}" required>
            </div>

            <div class="mb-3">
                <!-- Campo para la cantidad de producto -->
                <label for="cantidadProducto" class="form-label">Cantidad de Producto:</label>
                <input type="number" class="form-control" id="cantidadProducto" name="cantidadProducto" value="${param.cantidadProducto}" required>
            </div>

            <div class="mb-3">
                <!-- Campo para el IVA -->
                <label for="iva" class="form-label">IVA:</label>
                <input type="number" class="form-control" id="iva" name="iva" step="0.01" value="${param.iva}" required>
            </div>

            <div class="mb-3">
                <!-- Campo para el descuento -->
                <label for="descuento" class="form-label">Descuento:</label>
                <input type="number" class="form-control" id="descuento" name="descuento" step="0.01" value="${param.descuento}" required>
            </div>

            <!-- Campos calculados automáticamente -->
            <div class="mb-3">
                <label for="subtotal" class="form-label">Subtotal:</label>
                <input type="text" class="form-control" id="subtotal" name="subtotal" value="${param.subTotal}" readonly>
            </div>

            <div class="mb-3">
                <label for="total" class="form-label">Total:</label>
                <input type="text" class="form-control" id="total" name="total" value="${param.total}" readonly>
            </div>

            <div class="mb-3">
                <!-- Campo para el NIT -->
                <label for="nit" class="form-label">NIT:</label>
                <input type="text" class="form-control" id="nit" name="nit" value="${param.nit}" required>
            </div>

            <div class="mb-3">
                <!-- Campo para el ID del Cliente -->
                <label for="idCliente" class="form-label">ID Cliente:</label>
                <input type="text" class="form-control" id="idCliente" name="idCliente" value="${param.ID_Cliente}" required>
            </div>

            <button type="submit" class="btn btn-primary">Guardar Cambios</button>
        </form>
    </div>

 
    <!-- Enlaces a Bootstrap JS y Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <!-- JavaScript al final de la página -->
    <script>
        function regresar() {
            // Utiliza window.history para retroceder una página en el historial del navegador
            window.history.back();
        }
    </script>
       <!-- Botón de regreso -->
    <a href="#" class="btn btn-secondary ms-3" onclick="regresar()">Regresar</a>
</body>

</html>
