<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Cargo</title>
    </head>
    <body>   
        <h1>Modificar cargo</h1>
        <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=ModificarCargo">
            <div>
                <label>ID Cargo:</label>
                <input type="text" name="ID_Cargo" id="ID_Cargo" value="${param.ID_Cargo}" readonly /><br>
                <label>Cargo:</label>
                <input type="text" name="cargo" id="cargo" value="${param.cargo}" required /><br><br>        
                <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar el cargo?')" /><br><br> 
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