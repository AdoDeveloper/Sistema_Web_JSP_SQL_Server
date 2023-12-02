<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Gestión de Clientes</title>
        <!-- Enlaces a Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer">
        <style>
            body {
                padding-top: 56px;
            }

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
        <div class="container mt-5">
            <h1 class="mb-4">Gestión de Clientes</h1>
            <h2>Listado de Clientes</h2>
            <a href="/SistemaWeb?accion=RegistroClientes" class="btn btn-primary">Agregar cliente</a><br><br>

            <table class="table">
                <thead>
                    <tr>
                        <th>ID Cliente</th>
                        <th>DUI</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Fecha Nacimiento</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listaClientes}" var="item">
                        <tr>
                            <td><c:out value="${item.ID_Cliente}" /></td>
                            <td><c:out value="${item.DUI_Cliente}" /></td>
                            <td><c:out value="${item.nombresCliente}" /></td>
                            <td><c:out value="${item.apellidosCliente}" /></td>
                            <td><c:out value="${item.fechaNacCliente}" /></td>
                            <td>
                                <div class="btn-group" role="group">
                                    <button class="btn btn-info" onclick="mostrarDetallesCliente(
                                                        '${item.ID_Cliente}',
                                                        '${item.nombresCliente}',
                                                        '${item.apellidosCliente}',
                                                        '${item.DUI_Cliente}',
                                                        '${item.fechaNacCliente}',
                                                        '${item.telefono}',
                                                        '${item.correo}',
                                                        '${item.ID_Direccion}',
                                                        '${item.direccionCompleta}'
                                                        )">Ver detalles
                                    </button>

                                    <form method="POST" action="/SistemaWeb/ModificarCliente.jsp">
                                        <input type="hidden" name="ID_Cliente" value="${item.ID_Cliente}" />
                                        <input type="hidden" name="nombresCliente" value="${item.nombresCliente}" />
                                        <input type="hidden" name="apellidosCliente" value="${item.apellidosCliente}" />
                                        <input type="hidden" name="DUI_Cliente" value="${item.DUI_Cliente}" />
                                        <input type="hidden" name="fechaNacCliente" value="${item.fechaNacCliente}" />
                                        <input type="hidden" name="telefono" value="${item.telefono}" />
                                        <input type="hidden" name="correo" value="${item.correo}" />
                                        <input type="hidden" name="ID_Direccion" value="${item.ID_Direccion}" />
                                        <button type="submit" class="btn btn-warning"><i class="fas fa-edit"></i></button>
                                    </form>

                                    <form method="POST" action="/SistemaWeb/EliminarCliente.jsp">
                                        <input type="hidden" name="ID_Cliente" value="${item.ID_Cliente}" />
                                        <input type="hidden" name="nombresCliente" value="${item.nombresCliente}" />
                                        <input type="hidden" name="apellidosCliente" value="${item.apellidosCliente}" />
                                        <input type="hidden" name="DUI_Cliente" value="${item.DUI_Cliente}" />
                                        <input type="hidden" name="fechaNacCliente" value="${item.fechaNacCliente}" />
                                        <input type="hidden" name="telefono" value="${item.telefono}" />
                                        <input type="hidden" name="correo" value="${item.correo}" />
                                        <input type="hidden" name="ID_Direccion" value="${item.ID_Direccion}" />
                                        <button type="submit" class="btn btn-danger"><i class="fas fa-trash-alt"></i></button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Detalles del Cliente -->
            <div class="overlay" id="overlay"></div>
            <div class="popup-container" id="popup">
                <label>ID Cliente: <span id="ID_Cliente"></span></label><br>
                <label>Nombres: <span id="nombresCliente"></span></label><br>
                <label>Apellidos: <span id="apellidosCliente"></span></label><br>
                <label>DUI: <span id="DUI_Cliente"></span></label><br>
                <label>Fecha de Nacimiento: <span id="fechaNacCliente"></span></label><br>
                <label>Telefono: <span id="telefono"></span></label><br>
                <label>Email: <span id="correo"></span></label><br>
                <label>Dirección Completa: <span id="direccionCompleta"></span></label><br><br>
                <button onclick="abrirPopup()" class="btn btn-secondary">Cerrar</button>
            </div>
        </div>

        <!-- Enlaces a Bootstrap JS y Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

        <script>
                    function abrirPopup() {
                        var popup = document.getElementById('popup');
                        var overlay = document.getElementById('overlay');

<<<<<<< HEAD
                        if (popup.style.display === 'block') {
                            popup.style.display = 'none';
                            overlay.style.display = 'none';
                        } else {
                            popup.style.display = 'block';
                            overlay.style.display = 'block';
                        }
                    }

                    function mostrarDetallesCliente(ID_Cliente, nombresCliente, apellidosCliente, DUI_Cliente, fechaNacCliente, telefono, correo, ID_Direccion, direccionCompleta) {
                        document.getElementById('ID_Cliente').textContent = ID_Cliente;
                        document.getElementById('nombresCliente').textContent = nombresCliente;
                        document.getElementById('apellidosCliente').textContent = apellidosCliente;
                        document.getElementById('DUI_Cliente').textContent = DUI_Cliente;
                        document.getElementById('fechaNacCliente').textContent = fechaNacCliente;
                        document.getElementById('telefono').textContent = telefono;
                        document.getElementById('correo').textContent = correo;
                        document.getElementById('direccionCompleta').textContent = direccionCompleta;

                        abrirPopup();
                    }
        </script>
    </body>

</html>
=======
            // Muestra el pop-up
            abrirPopup();
        }
    </script>
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
