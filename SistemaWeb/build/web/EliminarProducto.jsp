<%-- 
    Document   : EliminarProducto
    Created on : 19 nov 2023, 08:24:39
    Author     : Kevin Aparicio
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Producto</title>
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
        <h1>Eliminar Producto</h1>

        <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=eliminarProducto">
            <div>
                <label>ID Producto: ${param.ID_Producto}</label><br>
                <label>Nombre Producto: ${param.nombreProducto}</label><br>
                <label>Descripcion: ${param.descripcion}</label><br>
                <label>Precio Unitario: ${param.precioUnitario}</label><br>
                <label>Existencia: ${param.existencia}</label><br>
                <label>Id Proveedor: ${param.ID_Proveedor}</label><br>
                <label>Nombre Proveedor: ${param.nombreProveedor}</label><br>
                <label>Telefono Proveedor: ${param.telefonoProveedor}</label><br>  
                <input type="hidden" name="ID_Producto" id="ID_Producto" value="${param.ID_Producto}" /><br><br>
<<<<<<< HEAD
                <input type="submit" class="btn btn-danger" value="Eliminar" onclick="return confirm('¿Desea eliminar este Producto?')" /><br><br>
            </div>
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
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar este Producto?')" /><br><br>
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
>>>>>>> fe823a4b2765e432939ff7989782ca0dc7fa6d68
    </body>
</html>
    