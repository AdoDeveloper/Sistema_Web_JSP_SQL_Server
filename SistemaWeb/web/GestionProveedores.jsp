<%-- 
    Document   : GestionProveedores
    Created on : 2 dic 2023, 01:18:03
    Author     : gabri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Proveedores</title>
        <style>
            /* Estilo para el contenedor del pop-up */
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

            /* Estilo para el fondo oscuro */
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
        </style>
    </head>
    <body>
        <h1>Gestión de Proveedores</h1>
        <h2>Listado de Proveedores</h2>
        <!--<h3>Conexion: ${mensaje_conexion}</h3><br>-->

        <a href="/SistemaWeb?accion=RegistroEmpleados">Agregar Proveedor</a><br><br>

        <table border="1">
            <thead>
                <tr>
                    <th>ID_Proveedor</th>
                    <th>Nombre</th>
                    <th>Telefono</th>
                    <th>Direccion</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaProveedores}" var="item">
                    <tr>
                        <!-- Mostrar -->
                        <td><c:out value="${item.ID_Proveedor}" /></td>
                        <td><c:out value="${item.nombreProveedor}" /></td>                     
                        <td><c:out value="${item.telefonoProveedor}" /></td>
                        <!--<td><c:out value="${item.ID_Direccion}" /></td>-->
                        <td><c:out value="${item.direccionCompleta}" /></td>
                        <td>
                            <!-- Ver detalles -->
                            <button class="open-popup-btn" 
                                    onclick="mostrarProveedor(
                                                    '${item.ID_Proveedor}',
                                                    '${item.nombreProveedor}',
                                                    '${item.telefonoProveedor}',
                                                    '${item.ID_Direccion}',
                                                    '${item.direccionCompleta}'
                                                    )">Ver detalles
                            </button>
                            <!-- Contenedor del pop-up -->
                            <div class="overlay" id="overlay"></div>
                            <div class="popup-container" id="popup">
                                <label>ID Proveedor: <span id="ID_Proveedor"></span></label><br>
                                <label>Nombre: <span id="nombreProveedor"></span></label><br>
                                <label>Telefono: <span id="telefonoProveedor"></span></label><br>
                                <label>ID_Direccion: <span id="ID_Direccion"></span></label><br>
                                <label>Dirección: <span id="direccionCompleta"></span></label><br><br>
                                <button onclick="abrirPopup()">Cerrar</button>
                            </div>

                            <!-- Modificar -->
                            <form method="POST" action="/SistemaWeb/modificarProveedor.jsp">
                                <input type="hidden" name="ID_Proveedor" value="${item.ID_Proveedor}" />
                                <input type="hidden" name="nombreProveedor" value="${item.nombreProveedor}" />
                                <input type="hidden" name="telefonoProveedor" value="${item.telefonoProveedor}" />
                                <input type="hidden" name="ID_Direccion" value="${item.ID_Direccion}" />
                                <input type="submit" value="Modificar" />
                            </form>

                            <!-- Eliminar -->   
                            <form method="POST" action="/SistemaWeb/EliminarProveedor.jsp">
                                <input type="hidden" name="ID_Proveedor" value="${item.ID_Proveedor}" />
                                <input type="hidden" name="nombreProveedor" value="${item.nombreProveedor}" />
                                <input type="hidden" name="telefonoProveedor" value="${item.telefonoProveedor}" />
                                <input type="hidden" name="ID_Direccion" value="${item.ID_Direccion}" />
                                <input type="hidden" name="direccionCompleta" value="${item.direccionCompleta}" />
                                <input type="submit" value="Eliminar" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table> 
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

        function mostrarProveedor(ID_Proveedor, nombreProveedor, telefonoProveedor, ID_Direccion, direccionCompleta) {
            document.getElementById('ID_Proveedor').textContent = ID_Proveedor;
            document.getElementById('nombreProveedor').textContent = nombreProveedor;
            document.getElementById('telefonoProveedor').textContent = telefonoProveedor;
            document.getElementById('ID_Direccion').textContent = ID_Direccion;
           document.getElementById('direccionCompleta').textContent = direccionCompleta;

            // Muestra el pop-up
            abrirPopup();
        }
    </script>
</html>
