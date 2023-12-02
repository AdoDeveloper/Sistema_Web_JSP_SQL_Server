<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registro de Direcciones</title>
</head>
<body>
    <c:if test="${exito != null}">
        <c:if test="${exito}">
            <p><strong style="color: darkgreen;">La dirección se registró correctamente.</strong></p>
        </c:if>
        <c:if test="${!exito}">
            <p><strong style="color: red;">No se pudo registrar la dirección.</strong></p>
        </c:if>
    </c:if>

    <h1>Registro de Direcciones</h1>
     <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=AgregarDireccion">
        <label>Linea 1:</label>
        <input type="text" name="linea1" required /><br>
        <label>Linea 2:</label>
        <input type="text" name="linea2" required /><br>
        <label>Distrito:</label>
                <select name="ID_Distrito" id="ID_Distrito" required>
                    <option value="">Seleccione una opción</option>
                    <c:forEach var="item" items="${listaDistritos}">
                        <option value="${item.ID_Distrito}">${item.distrito}</option>
                    </c:forEach>
                </select><br>
        <label>Código Postal:</label>
        <input type="number" name="codigoPostal" required /><br>

        <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar la dirección?')" />
        <input type="button" value="Limpiar" onclick="limpiarFormulario()" />
    </form>

    <!-- Botón de regreso -->
    <button onclick="regresar()">Regresar</button>

    <!-- JavaScript al final de la página -->
    <script>
        function limpiarFormulario() {
            document.getElementsByName("linea1")[0].value = "";
            document.getElementsByName("linea2")[0].value = "";
            document.getElementsByName("ID_Distrito")[0].value = "-1";
            document.getElementsByName("codigoPostal")[0].value = "";
        }

        function regresar() {
            // Utiliza window.history para retroceder una página en el historial del navegador
            window.history.back();
        }
    </script>
</body>
</html>
