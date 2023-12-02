    <%-- 
        Document   : ModificarEmpleado
        Created on : 5 nov 2023, 14:13:36
        Author     : ernes
    --%>

    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<<<<<<< HEAD
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Modificar Empleado</title>
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
    </style>
</head>
<body>
    <h1 class="mb-4">Modificar empleado</h1>
    <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=ModificarEmpleado" class="form-container">
        <div class="form-group">
            <label class="form-label">ID Empleado:</label>
            <input type="text" class="form-control" name="ID_Empleado" id="ID_Empleado" value="${param.ID_Empleado}" readonly />
        </div>
        <div class="form-group">
            <label class="form-label">DUI:</label>
            <input type="text" class="form-control" name="DUI_Empleado" id="DUI_Empleado" value="${param.DUI_Empleado}" required />
        </div>
        <div class="form-group">
            <label class="form-label">Número de afiliado ISSS:</label>
            <input type="text" class="form-control" name="ISSS_Empleado" id="ISSS_Empleado" value="${param.ISSS_Empleado}" required />
        </div>
        <div class="form-group">
            <label class="form-label">Nombres:</label>
            <input type="text" class="form-control" name="nombresEmpleado" id="nombresEmpleado" value="${param.nombresEmpleado}" required />
        </div>
        <div class="form-group">
            <label class="form-label">Apellidos:</label>
            <input type="text" class="form-control" name="apellidosEmpleado" id="apellidosEmpleado" value="${param.apellidosEmpleado}" required />
        </div>
        <div class="form-group">
            <label class="form-label">Fecha de nacimiento:</label>
            <input type="date" class="form-control" name="fechaNacEmpleado" id="fechaNacEmpleado" value="${param.fechaNacEmpleado}" required />
        </div>
        <div class="form-group">
            <label class="form-label">Teléfono:</label>
            <input type="text" class="form-control" name="telefonoEmpleado" id="telefonoEmpleado" value="${param.telefono}" required />
        </div>
        <div class="form-group">
            <label class="form-label">Correo:</label>
            <input type="email" class="form-control" name="correo" id="correo" value="${param.correo}" required />
        </div>
        <div class="form-group">
            <label class="form-label">ID Cargo:</label>
            <input type="text" class="form-control" name="ID_Cargo" id="ID_Cargo" value="${param.ID_Cargo}" required />
        </div>
        <div class="form-group">
            <label class="form-label">ID Dirección:</label>
            <input type="text" class="form-control" name="ID_Direccion" id="ID_Direccion" value="${param.ID_Direccion}" required />
        </div>
        <div class="form-group">
            <input type="submit" class="btn btn-primary" value="Modificar" onclick="return confirm('¿Desea modificar el empleado?')" />
        </div>
        <div class="form-group">
            <a href="/SistemaWeb/?accion=GestionEmpleados" class="btn btn-secondary">Regresar</a>
        </div>
    </form>

    <!-- Enlace a Bootstrap JS y Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>

=======
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Modificar Empleado</title>
        </head>
        <body>   
            <h1>Modificar empleado</h1>
            <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=ModificarEmpleado">
                <div>
                    <label>ID Empleado:</label>
                    <input type="text" name="ID_Empleado" id="ID_Empleado" value="${param.ID_Empleado}" readonly /><br>
                    <label>DUI:</label>
                    <input type="text" name="DUI_Empleado" id="DUI_Empleado" value="${param.DUI_Empleado}" required /><br>
                    <label>Número de afiliado ISSS:</label>
                    <input type="text" name="ISSS_Empleado" id="ISSS_Empleado" value="${param.ISSS_Empleado}" required /><br>
                    <label>Nombres:</label>
                    <input type="text" name="nombresEmpleado" id="nombresEmpleado" value="${param.nombresEmpleado}" required /><br>
                    <label>Apellidos:</label>
                    <input type="text" name="apellidosEmpleado" id="apellidosEmpleado" value="${param.apellidosEmpleado}" required /><br>
                    <label>Fecha de nacimiento:</label>
                    <input type="date" name="fechaNacEmpleado" id="fechaNacEmpleado" value="${param.fechaNacEmpleado}" required /><br>
                    <label>Teléfono:</label>
                    <input type="text" name="telefonoEmpleado" id="telefonoEmpleado" value="${param.telefono}" required /><br>
                    <label>Correo:</label>
                    <input type="email" name="correo" id="correo" value="${param.correo}" required /><br>
                    <label>ID Cargo:</label>
                    <input type="text" name="ID_Cargo" id="ID_Cargo" value="${param.ID_Cargo}" required /><br>
                    <label>ID Dirección:</label>
                    <input type="text" name="ID_Direccion" id="ID_Direccion" value="${param.ID_Direccion}" required /><br><br>           
                    <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar el empleado?')" /><br><br> 
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
>>>>>>> fe823a4b2765e432939ff7989782ca0dc7fa6d68
