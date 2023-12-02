<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Registro de Ventas</title>
        <!-- Enlaces a Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>

    <body class="bg-light">
        <div class="container mt-5">
            <h2>Registro de Ventas</h2>
            <c:if test="${exito!=null}">
                <c:if test="${exito}">
                    <p class="alert alert-success"><strong>La información se guardó correctamente</strong></p>
                </c:if>
                <c:if test="${!exito}">
                    <p class="alert alert-danger"><strong>No se guardó la información</strong></p>
                </c:if>
            </c:if>   
            <h1 class="mb-4">Agregar nueva venta</h1>

            <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=RegistroVenta" oninput="calcularTotal()">
                <div class="mb-3">
                    <label for="fechaVenta" class="form-label">Fecha Venta:</label>
                    <input type="date" id="fechaVenta" name="fechaVenta" value="<%= new java.sql.Date(System.currentTimeMillis()) %>" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="idProducto" class="form-label">Seleccione un Producto:</label>
                    <select id="idProducto" name="idProducto" class="form-select" required>
                        <c:forEach var="producto" items="${listaProductos}">
                            <option value="${producto.ID_Producto}" data-precio="${producto.precioUnitario}">${producto.nombreProducto} - Precio: ${producto.precioUnitario}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="cantidadProducto" class="form-label">Cantidad de Producto:</label>
                    <input type="number" id="cantidadProducto" name="cantidadProducto" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="iva" class="form-label">IVA:</label>
                    <input type="number" id="iva" name="iva" step="0.01" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="descuento" class="form-label">Descuento:</label>
                    <input type="number" id="descuento" name="descuento" step="0.01" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="subtotal" class="form-label">Subtotal:</label>
                    <input type="text" id="subtotal" name="subtotal" readonly class="form-control">
                </div>

                <div class="mb-3">
                    <label for="total" class="form-label">Total:</label>
                    <input type="text" id="total" name="total" readonly class="form-control">
                </div>

                <div class="mb-3">
                    <label for="nit" class="form-label">NIT:</label>
                    <input type="text" id="nit" name="nit" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="idCliente" class="form-label">Seleccione un Cliente:</label>
                    <select id="idCliente" name="idCliente" class="form-select" required>
                        <c:forEach var="cliente" items="${listaClientes}">
                            <option value="${cliente.ID_Cliente}">${cliente.nombresCliente} ${cliente.apellidosCliente}</option>
                        </c:forEach>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">Registrar Venta</button>
            </form>
        </div>

        <!-- Botón de regreso -->
        <a href="#" class="btn btn-secondary ms-3" onclick="regresar()">Regresar</a>

        <!-- Enlaces a Bootstrap JS y Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <!-- JavaScript al final de la página -->
        <script>
            function regresar() {
                // Utiliza window.history para retroceder una página en el historial del navegador
                window.history.back();
            }

            function calcularTotal() {
                // Obtener los valores seleccionados por el usuario
                var seleccionProducto = document.getElementById("idProducto");
                var precioUnitario = parseFloat(seleccionProducto.options[seleccionProducto.selectedIndex].getAttribute("data-precio"));
                var cantidadProducto = parseInt(document.getElementById("cantidadProducto").value);
                var iva = parseFloat(document.getElementById("iva").value);
                var descuento = parseFloat(document.getElementById("descuento").value);

                // Calcular los campos restantes
                var subtotal = precioUnitario * cantidadProducto;
                var total = (subtotal + (subtotal * (iva / 100))) - descuento;

                // Mostrar los resultados en los campos correspondientes
                document.getElementById("subtotal").value = subtotal.toFixed(2);
                document.getElementById("total").value = total.toFixed(2);
            }
        </script>
    </body>

</html>
