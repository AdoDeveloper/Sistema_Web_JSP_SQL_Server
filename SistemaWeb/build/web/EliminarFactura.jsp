<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Eliminar Factura</title>
    <!-- Agrega aquí tus enlaces a hojas de estilo, scripts, etc. si es necesario -->
</head>
<body>
    <h1>Eliminar Factura</h1>

    <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=EliminarFactura" onsubmit="return confirm('¿Estás seguro de que deseas eliminar esta factura?');">
        <div>
            <label>ID Venta: ${param.id_venta}</label><br>
            <label>ID Producto: ${param.ID_Producto}</label><br>
            <label>Fecha de Venta: ${param.fechaVenta}</label><br>
            <label>Cantidad de Producto: ${param.cantidadProducto}</label><br>
            <label>IVA: ${param.iva}</label><br>
            <label>Descuento: ${param.descuento}</label><br>
            <label>Subtotal: ${param.subTotal}</label><br>
            <label>Total: ${param.total}</label><br>
            <label>NIT: ${param.nit}</label><br>
            <label>ID Cliente: ${param.ID_Cliente}</label><br>
            <input type="hidden" name="id_venta" id="id_venta" value="${param.id_venta}" /><br><br>
            <input type="submit" value="Eliminar" /><br><br>
        </div>
    </form>

                <!-- Botón de regreso -->
    <button onclick="regresar()">Regresar</button>
     <!-- JavaScript al final de la página -->
    <script>
        function regresar() {
        // Utiliza window.history para retroceder una página en el historial del navegador
        window.history.back();
        }
    </script>

</body>
</html>
