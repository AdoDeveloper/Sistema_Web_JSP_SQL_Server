<%-- 
    Document   : ModificarPedido
    Created on : 1 dic 2023, 10:32:06
    Author     : gabri
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Pedido</title>
    </head>
    <body>   
        <h1>Modificar Pedido</h1>
        <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=ModificarPedido">
            <form>
                <div>
                     <input type="hidden" name="ID_Pedido" id="ID_Pedido" value="${param.ID_Pedido}" required /><br>
 
                    <label>Fecha Pedido:</label>
                    <input type="date" name="fechaPedido" id="fechaPedido" value="${param.fechaPedido}" required /><br>

                    <label>Monto:</label>
                    <input type="text" name="monto" id="monto" value="${param.monto}" required /><br>

                    <label>Cantidad:</label>
                    <input type="number" name="cantidad" id="cantidad" value="${param.cantidad}" required /><br>
                    
                    <label>ID Producto:</label>
                    <input type="number" name="ID_Producto" id="ID_Producto" value="${param.ID_Producto}" required  /><br>

                    <label>ID Proveedor:</label>
                    <input type="number" name="ID_Proveedor" id="ID_Proveedor" value="${param.ID_Proveedor}" required /><br>

                    <input type="hidden" name="ID_DetallePedido" id="ID_DetallePedido" value="${param.ID_DetallePedido}" required /><br>

               

                
                    <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar el pedido?')" /><br><br>
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


            </form>
    </body>
</html>
