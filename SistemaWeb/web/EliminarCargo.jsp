<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Cargo</title>
    </head>
    <body>
        <h1>Eliminar cargo</h1>

        <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=EliminarCargo">
            <div>
                <label>ID Cargo: ${param.ID_Cargo}</label><br>
                <label>Cargo: ${param.cargo}</label><br> 
                <input type="hidden" name="ID_Cargo" id="ID_Cargo" value="${param.ID_Cargo}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el cargo?')" /><br><br>
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