<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Factura</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            height: 100vh;
        }

        .container {
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 50%; /* Ajusta el ancho según tus necesidades */
            overflow: auto;
        }
        
        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .company-info,
        .customer-info,
        .invoice-details,
        .sale-details,
        .product-details,
        .footer {
            margin-bottom: 20px;
        }

        h5 {
            color: #3498db;
        }

        p {
            margin: 5px 0;
        }

        .thank-you {
            text-align: center;
            font-weight: bold;
            margin-top: 20px;
        }
        
        p.money {
            color: #3498db;
            font-weight: bold;
            margin: 5px 0;
            display: inline-block; /* Para evitar el margen adicional */
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="header">
            <h4><i class="fas fa-building"></i> Empresa XYZ</h4>
            <p>Dirección: Dirección de la empresa</p>
            <p>Teléfono: Número de teléfono de la empresa</p>
            <p>Email: Email de la empresa</p>
        </div>

        <div class="company-info">
            <h5><i class="fas fa-user"></i> Información del Cliente</h5>
            <!--<p>ID Cliente: <c:out value="${detallesFactura.ID_Cliente}" /></p>-->
            <p>Nombres: <c:out value="${detallesFactura.nombres}" /></p>
            <p>Apellidos: <c:out value="${detallesFactura.apellidos}" /></p>
            <p>DUI: <c:out value="${detallesFactura.dui}" /></p>
            <p>Fecha de Nacimiento: <c:out value="${detallesFactura.fechaNac}" /></p>
            <p>Email: <c:out value="${detallesFactura.email}" /></p>
        </div>

        <div class="invoice-details">
            <h5><i class="fas fa-file-invoice"></i> Detalles de la Factura</h5>
            <!--<p>ID Factura: <c:out value="${detallesFactura.id_factura}" /></p>-->
            <p>IVA: $<c:out value="${detallesFactura.iva}" /></p>
            
            <p>Subtotal: $<c:out value="${detallesFactura.subTotal}" /></p>
            <p>Descuento: $<c:out value="${detallesFactura.descuento}" /></p>
            <p>Total: $<c:out value="${detallesFactura.total}" /></p>
            <p>NIT: <c:out value="${detallesFactura.nit}" /></p>
        </div>

        <div class="sale-details">
            <div>
                <h5><i class="fas fa-cash-register"></i> Detalles de la Venta</h5>
               <!-- <p>ID Venta: <c:out value="${detallesFactura.id_venta}" /></p>-->
                <p>Monto de Venta: $<c:out value="${detallesFactura.montoVenta}" /></p>
                <p>Fecha de Venta: <c:out value="${detallesFactura.fechaVenta}" /></p>
            </div>
            <div>
                <h5><i class="fas fa-box"></i> Detalles del Producto</h5>
                <!--<p>ID: <c:out value="${detallesFactura.ID_Producto}"/> </p>-->
                <p>Nombre del Producto: <c:out value="${detallesFactura.nombreProducto}" /></p>
                <p>Precio Unitario: $<c:out value="${detallesFactura.precioUnitario}" /></p>
                <p>Cantidad: <c:out value="${detallesFactura.cantidadProducto}" /></p>
            </div>
        </div>

        <div class="footer">
            <p>Gracias por su compra. ¡Vuelva pronto!</p>
        </div>

        <div>
            <div>
                <div id="barcode"></div>
            </div>
        </div>
            
  
  
           <!-- Botón de regreso -->
    <button onclick="regresar()">Regresar</button> <!-- Botón para modificar la factura -->
    <form method="post" action="/SistemaWeb/ModificarFactura.jsp">
        <!-- Campos ocultos con la información a enviar -->
        <input type="hidden" name="id_venta" value="${detallesFactura.id_venta}" />
        <input type="hidden" name="ID_Producto" value="${detallesFactura.ID_Producto}" />
        <input type="hidden" name="fechaVenta" value="${detallesFactura.fechaVenta}" />
        <input type="hidden" name="cantidadProducto" value="${detallesFactura.cantidadProducto}" />
        <input type="hidden" name="iva" value="${detallesFactura.iva}" />
        <input type="hidden" name="descuento" value="${detallesFactura.descuento}" />
        <input type="hidden" name="subTotal" value="${detallesFactura.subTotal}" />
        <input type="hidden" name="total" value="${detallesFactura.total}" />
        <input type="hidden" name="nit" value="${detallesFactura.nit}" />
        <input type="hidden" name="ID_Cliente" value="${detallesFactura.ID_Cliente}" />
        <!-- Botón para enviar el formulario -->
        <input type="submit" value="Modificar" />
    </form>

    <!-- Formulario para enviar información a EliminarFactura.jsp -->
    <form method="post" action="/SistemaWeb/EliminarFactura.jsp" onsubmit="return confirm('¿Estás seguro de que deseas eliminar esta factura?');">
        <!-- Campos ocultos con la información a enviar -->
        <input type="hidden" name="id_venta" value="${detallesFactura.id_venta}" />
        <input type="hidden" name="ID_Producto" value="${detallesFactura.ID_Producto}" />
        <input type="hidden" name="fechaVenta" value="${detallesFactura.fechaVenta}" />
        <input type="hidden" name="cantidadProducto" value="${detallesFactura.cantidadProducto}" />
        <input type="hidden" name="iva" value="${detallesFactura.iva}" />
        <input type="hidden" name="descuento" value="${detallesFactura.descuento}" />
        <input type="hidden" name="subTotal" value="${detallesFactura.subTotal}" />
        <input type="hidden" name="total" value="${detallesFactura.total}" />
        <input type="hidden" name="nit" value="${detallesFactura.nit}" />
        <input type="hidden" name="ID_Cliente" value="${detallesFactura.ID_Cliente}" />

        <input type="submit" value="Eliminar" />
    </form>


    </div>
            <!-- Botón de regreso -->
    <button onclick="regresar()">Regresar</button>
     <!-- JavaScript al final de la página -->
    <script>
        function regresar() {
        // Utiliza window.history para retroceder una página en el historial del navegador
        window.history.back();
        }
    </script>
    <script src="https://cdn.jsdelivr.net/jsbarcode/3.11.0/JsBarcode.all.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
</body>

</html>
