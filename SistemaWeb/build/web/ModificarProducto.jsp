<%-- 
    Document   : ModificarProducto
    Created on : 19 nov 2023, 08:25:01
    Author     : Kevin Aparicio
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Producto</title>
        <!-- Enlace a Bootstrap CSS --> 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer">
        <style>
            body {
                padding: 20px;
            }

            .popup-container {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                padding: 20px;
                background-color: #f0f0f0;
                border: 1px solid #ccc;
                z-index: 1;
            }

            .overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 0;
            }

            .form-actions {
                display: flex;
                justify-content: space-between;
            }
        </style>
    </head>
    <body>
        <h1>Modificar Producto</h1>
        <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=modificarProducto">
            <div>
                <label>ID Producto:</label>
                <input type="text" name="ID_Producto" id="ID_Producto" value="${param.ID_Producto}" readonly /><br>
                <label>Nombre del Producto:</label>
                <input type="text" name="Nombre_Producto" id="Nombre_Producto" value="${param.nombreProducto}" required /><br>
                <label>Descripción:</label>
                <textarea name="Descripcion" id="Descripcion" required>${param.descripcion}</textarea><br>
                <label>Precio Unitario:</label>
                <input type="text" name="Precio_Unitario" id="Precio_Unitario" value="${param.precioUnitario}" required /><br>
                <label>Existencia:</label>
                <input type="text" name="Existencia" id="Existencia" value="${param.existencia}" required /><br>
                <label>ID Proveedor:</label>
                <input type="text" name="ID_Proveedor" id="ID_Proveedor" value="${param.ID_Proveedor}" required /><br>
                <label>Nombre del Proveedor:</label>
                <input type="text" name="Nombre_Proveedor" id="Nombre_Proveedor" value="${param.nombreProveedor}" required /><br>
                <label>Teléfono del Proveedor:</label>
                <input type="text" name="Telefono_Proveedor" id="Telefono_Proveedor" value="${param.telefonoProveedor}" required /><br><br>           
                <input type="submit" class="btn btn-warning" value="Modificar" onclick="return confirm('¿Desea modificar el producto?')" /><br><br> 
            </div>
<<<<<<< HEAD
            <div>
                <a href="/SistemaWeb/?accion=GestionProductos" class="btn btn-secondary">Regresar</a><br><br>
            </div>             
        </form>

        <!-- Enlace a Bootstrap JS y Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script>
                    function abrirPopup() {
                        var popup = document.getElementById('popup');
                        var overlay = document.getElementById('overlay');

                        if (popup.style.display === 'block') {
                            popup.style.display = 'none';
                            overlay.style.display = 'none';
                        } else {
                            popup.style.display = 'block';
                            overlay.style.display = 'block';
                        }
                    }
        </script>
=======
           
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
>>>>>>> fe823a4b2765e432939ff7989782ca0dc7fa6d68
    </body>
</html>
