<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gestión de Ventas</title>
    <!-- Enlace a Bootstrap CSS --> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer">
    <style>
        body {
            padding: 20px;
        }

        .popup-container {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-color: #f0f0f0;
            border: 1px solid #ccc;
            z-index: 1;
        }

        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 0;
        }

        .form-actions {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>
    <h1>Gestión de Ventas</h1>
    <h2>Listado de Ventas</h2><br>
    <a href="/SistemaWeb?accion=RegistroVentas" class="btn btn-primary">Agregar venta</a><br><br>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID Venta</th>
                <th>Fecha de Venta</th>
                <th>Subtotal</th>
                <th>Total</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${listaVentas}" var="venta">
                <tr>
                    <td>${venta.ID_Venta}</td>
                    <td>${venta.fechaVenta}</td>
                    <td>${venta.subtotal}</td>
                    <td>${venta.total}</td>
                    <td>
                        <!-- Detalles y Ver Factura en un div flexible -->
                        <div class="d-flex">
                            <button class="btn btn-info me-2" onclick="mostrarDetallesVenta(
                                '${venta.ID_Venta}',
                                '${venta.fechaVenta}',
                                '${venta.subtotal}',
                                '${venta.total}',
                                '${venta.nombreProducto}',
                                '${venta.precioUnitario}',
                                '${venta.cantidadProducto}',
                                '${venta.nombreCliente}'
                            )">Detalles</button>

                            <form method="GET" action="/SistemaWeb?">
                                <input type="hidden" name="accion" value="verFactura" />
                                <input type="hidden" name="ID_Venta" value="${venta.ID_Venta}" />
                                <button type="submit" class="btn btn-secondary">Ver Factura</button>
                            </form>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- Detalles de la Venta -->
    <div class="overlay" id="overlay"></div>
    <div class="popup-container" id="popup">
        <label>ID Venta: <span id="ID_Venta"></span></label><br>
        <label>Fecha de Venta: <span id="fechaVenta"></span></label><br>
        <label>Subtotal: <span id="subtotal"></span></label><br>
        <label>Total: <span id="total"></span></label><br>
        <label>Detalles del Producto:</label><br>
        <span id="detallesProducto"></span><br>
        <span id="precioUnitario"></span><br>
        <span id="cantidadProducto"></span><br>
        <label>Nombre del Cliente: <span id="nombreCliente"></span></label><br>
        <br>
        <button class="btn btn-secondary" onclick="cerrarPopup()">Cerrar</button>
    </div>

    <!-- Botón de regreso -->
    <a href="#" class="btn btn-secondary" onclick="regresar()">Regresar</a>

    <!-- Enlace a Bootstrap JS y Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script>
        function regresar() {
            // Utiliza window.history para retroceder una página en el historial del navegador
            window.history.back();
        }

        function cerrarPopup() {
            var popup = document.getElementById('popup');
            var overlay = document.getElementById('overlay');
            popup.style.display = 'none';
            overlay.style.display = 'none';
        }

        function mostrarDetallesVenta( ID_Venta, fechaVenta, subtotal, total, nombreProducto, precioUnitario, cantidadProducto, nombreCliente) {
            document.getElementById('ID_Venta').textContent = ID_Venta;
            document.getElementById('fechaVenta').textContent = fechaVenta;
            document.getElementById('subtotal').textContent = subtotal;
            document.getElementById('total').textContent = total;
            document.getElementById('detallesProducto').textContent = 'Nombre del Producto: ' + nombreProducto;
            document.getElementById('precioUnitario').textContent = 'Precio Unitario: ' + precioUnitario;
            document.getElementById('cantidadProducto').textContent = 'Cantidad: ' + cantidadProducto;
            document.getElementById('nombreCliente').textContent = nombreCliente;

            // Muestra el pop-up
            var popup = document.getElementById('popup');
            var overlay = document.getElementById('overlay');
            popup.style.display = 'block';
            overlay.style.display = 'block';
        }
    </script>
</body>
</html>
