<%-- 
    Document   : EliminarProveedor
    Created on : 2 dic 2023, 01:51:31
    Author     : gabri
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Proveedor</title>
    </head>
    <body>
        <h1>Eliminar Proveedor</h1>

        <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=eliminarProveedor">
            <div>
                <label>ID Proveedor: ${param.ID_Proveedor}</label><br>
                <label>Nombre: ${param.nombreProveedor}</label><br>
                <label>Telefono ${param.telefonoProveedor}</label><br>
                <label>ID_Direccion: ${param.ID_Direccion}</label><br>                         
                <label>Dirección: ${param.direccionCompleta}</label>   
                <input type="hidden" name="ID_Proveedor" id="ID_Proveedor" value="${param.ID_Proveedor}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el proveedor?')" /><br><br>
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
