<%-- 
    Document   : RegistroEmpleados
    Created on : 12 oct 2023, 16:45:13
    Author     : ernes
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Agregar Empleado</title>

    <!-- Enlaces a Bootstrap y Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <c:if test="${exito!=null}">
            <c:if test="${exito}">
                <p class="text-success"><strong>La información se guardó correctamente</strong></p>
            </c:if>
            <c:if test="${!exito}">
                <p class="text-danger"><strong>No se guardó la información</strong></p>
            </c:if>
        </c:if>

        <h1 class="mb-4">Agregar nuevo empleado</h1>
            
        <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=RegistroEmpleado" class="mb-4">

            <label for="DUI_Empleado">DUI:</label>
            <input type="text" class="form-control" name="DUI_Empleado" id="DUI_Empleado" required />

            <label for="ISSS_Empleado" class="mt-3">Número de afiliado ISSS:</label>
            <input type="text" class="form-control" name="ISSS_Empleado" id="ISSS_Empleado" required />

            <label for="nombresEmpleado" class="mt-3">Nombres:</label>
            <input type="text" class="form-control" name="nombresEmpleado" id="nombresEmpleado" required />

            <label for="apellidosEmpleado" class="mt-3">Apellidos:</label>
            <input type="text" class="form-control" name="apellidosEmpleado" id="apellidosEmpleado" required />

            <label for="fechaNacEmpleado" class="mt-3">Fecha de nacimiento:</label>
            <input type="date" class="form-control" name="fechaNacEmpleado" id="fechaNacEmpleado" required />

            <label for="telefono" class="mt-3">Teléfono:</label>
            <input type="text" class="form-control" name="telefono" id="telefono" required />

            <label for="correo" class="mt-3">Correo:</label>
            <input type="email" class="form-control" name="correo" id="correo" required />

            <label for="ID_Cargo" class="mt-3">Cargo:</label>
            <select class="form-select" name="ID_Cargo" id="ID_Cargo" required>
                <option value="-1" selected>Seleccione una opción</option>
                <c:forEach var="item" items="${listaCargos}">
                    <option value="${item.ID_Cargo}">
                        ${item.cargo}
                    </option>
                </c:forEach>
            </select>
            <button type="button" class="btn btn-secondary mt-3" onclick="agregarCargo()">Nuevo cargo</button>

            <label for="ID_Direccion" class="mt-3">Dirección:</label>
            <select class="form-select" name="ID_Direccion" id="ID_Direccion" required>
                <option value="-1" selected>Seleccione una opción</option>
                <c:forEach var="item" items="${listaDirecciones}">
                    <option value="${item.ID_Direccion}">
                        ${item.linea1}, ${item.linea2}, ${item.ID_Distrito}, ${item.codigoPostal}
                    </option>
                </c:forEach>
            </select>
            <button type="button" class="btn btn-secondary mt-3" onclick="agregarDireccion()">Pre-registrar dirección</button>

            <div class="mt-3">
                <input type="submit" class="btn btn-primary" value="Registrar" onclick="return confirm('¿Desea registrar el empleado?')" />
                <input type="button" class="btn btn-secondary" value="Limpiar" onclick="limpiarFormulario()" />
                <button type="button" class="btn btn-info" onclick="location.href = '/SistemaWeb/?accion=GestionEmpleados'">Gestionar empleados</button>
            </div>
        </form>
    </div>

    <!-- Enlaces a Bootstrap JS y Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    <!-- Script adicional para abrir nuevas ventanas -->
    <script>
        function agregarCargo() {
            window.open('/SistemaWeb/?accion=RegistroCargo', '_blank', 'width=600, height=600, top=100, left=100, resizable=yes, scrollbars=yes');
        }

        function agregarDireccion() {
            window.open('/SistemaWeb/?accion=AgregarDireccion', '_blank', 'width=600, height=600, top=100, left=100, resizable=yes, scrollbars=yes');
        }

        function limpiarFormulario() {
            document.getElementById("DUI_Empleado").value = "";
            document.getElementById("ISSS_Empleado").value = "";
            document.getElementById("nombresEmpleado").value = "";
            document.getElementById("apellidosEmpleado").value = "";
            document.getElementById("fechaNacEmpleado").value = "";
            document.getElementById("telefono").value = "";
            document.getElementById("correo").value = "";
            document.getElementById("ID_Cargo").value = "-1";
            document.getElementById("ID_Direccion").value = "-1";
        }
    </script>
</body>
</html>
