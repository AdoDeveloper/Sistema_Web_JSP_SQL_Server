<%-- 
    Document   : ModificarProveedor
    Created on : 2 dic 2023, 01:58:24
    Author     : gabri
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Proveedor</title>
    </head>
    <body>   
        <h1>Modificar proveedor</h1>
        <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=modificarProveedor">
            <div>
                <label>ID Proveedor:</label>
                <input type="text" name="ID_Proveedor" id="ID_Proveedor" value="${param.ID_Proveedor}" readonly /><br>
                <label>Nombre:</label>
                <input type="text" name="nombreProveedor" id="nombreProveedor" value="${param.nombreProveedor}" required /><br>
                <label>Telefono:</label>
                <input type="text" name="telefonoProveedor" id="telefonoProveedor" value="${param.telefonoProveedor}" required /><br>
                <label>ID Direccion</label>
                <input type="text" name="ID_Direccion" id="ID_Direccion" value="${param.ID_Direccion}" required /><br> 

                <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar el proveedor?')" /><br><br> 
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