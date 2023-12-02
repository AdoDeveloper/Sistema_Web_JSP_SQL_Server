<%-- 
    Document   : EliminarEmpleado
    Created on : 5 nov 2023, 14:16:12
    Author     : ernes
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Eliminar Empleado</title>
    <!-- Enlace a Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        body {
            padding: 20px;
        }

        .form-container {
            max-width: 500px;
            margin: auto;
        }

        .form-label {
            font-weight: bold;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-actions {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>
    <h1 class="mb-4">Eliminar empleado</h1>
    <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=EliminarEmpleado" class="form-container">
        <div class="form-group">
            <label class="form-label">ID Empleado:</label>
            <span>${param.ID_Empleado}</span>
        </div>
        <div class="form-group">
            <label class="form-label">DUI:</label>
            <span>${param.DUI_Empleado}</span>
        </div>
        <div class="form-group">
            <label class="form-label">Número de afiliado ISSS:</label>
            <span>${param.ISSS_Empleado}</span>
        </div>
        <div class="form-group">
            <label class="form-label">Nombres:</label>
            <span>${param.nombresEmpleado}</span>
        </div>
        <div class="form-group">
            <label class="form-label">Apellidos:</label>
            <span>${param.apellidosEmpleado}</span>
        </div>
        <div class="form-group">
            <label class="form-label">Fecha de nacimiento:</label>
            <span>${param.fechaNacEmpleado}</span>
        </div>
        <div class="form-group">
            <label class="form-label">Teléfono:</label>
            <span>${param.telefono}</span>
        </div>
        <div class="form-group">
            <label class="form-label">Correo:</label>
            <span>${param.correo}</span>
        </div>
        <div class="form-group">
            <label class="form-label">Cargo:</label>
            <span>${param.cargo}</span>
        </div>
        <div class="form-group">
            <label class="form-label">Dirección:</label>
            <span>${param.direccionCompleta}</span>
        </div>
        <div class="form-actions">
            <input type="hidden" name="ID_Empleado" id="ID_Empleado" value="${param.ID_Empleado}" />
            <input type="submit" class="btn btn-danger" value="Eliminar" onclick="return confirm('¿Desea eliminar el empleado?')" />
            <a href="/SistemaWeb/?accion=GestionEmpleados" class="btn btn-secondary">Regresar</a>
        </div>
    </form>

    <!-- Enlace a Bootstrap JS y Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>

