<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de Productos</title>
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
        <h1>Gestión de Productos</h1>
        <h2>Listado de Productos</h2>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID_Producto</th>
                    <th>Nombre_Producto</th>
                    <th>Descripcion</th>
                    <th>Precio_Unitario</th>
                    <th>Existencia</th>
                    <th>ID Proveedor</th>
                    <th>Nombre Proveedor</th>
                    <th>Telefono Proveedor</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaProductos}" var="item">
                    <tr>
                        <td>${item.ID_Producto}</td>
                        <td>${item.nombreProducto}</td>
                        <td>${item.descripcion}</td>
                        <td>${item.precioUnitario}</td>
                        <td>${item.existencia}</td>
                        <td>${item.ID_Proveedor}</td>
                        <td>${item.nombreProveedor}</td>
                        <td>${item.telefonoProveedor}</td>
                        <td>
                            <button class="btn btn-info" onclick="mostrarDetallesProductos('${item.ID_Producto}', '${item.nombreProducto}', '${item.descripcion}', '${item.precioUnitario}', '${item.existencia}', '${item.ID_Proveedor}', '${item.nombreProveedor}', '${item.telefonoProveedor}')">Ver detalles</button>
                            <form method="POST" action="/SistemaWeb/ModificarProducto.jsp" style="display: inline;">
                                <input type="hidden" name="ID_Producto" value="${item.ID_Producto}" />
                                <input type="hidden" name="nombreProducto" value="${item.nombreProducto}" />
                                <input type="hidden" name="descripcion" value="${item.descripcion}" />
                                <input type="hidden" name="precioUnitario" value="${item.precioUnitario}" />
                                <input type="hidden" name="existencia" value="${item.existencia}" />
                                <input type="hidden" name="ID_Proveedor" value="${item.ID_Proveedor}" />
                                <input type="hidden" name="nombreProveedor" value="${item.nombreProveedor}" />
                                <input type="hidden" name="telefonoProveedor" value="${item.telefonoProveedor}" />
                                <button type="submit" class="btn btn-warning"><i class="fas fa-edit"></i></button>
                            </form>
                            <form method="POST" action="/SistemaWeb/EliminarProducto.jsp" style="display: inline;">
                                <input type="hidden" name="ID_Producto" value="${item.ID_Producto}" />
                                <input type="hidden" name="nombreProducto" value="${item.nombreProducto}" />
                                <input type="hidden" name="descripcion" value="${item.descripcion}" />
                                <input type="hidden" name="precioUnitario" value="${item.precioUnitario}" />
                                <input type="hidden" name="existencia" value="${item.existencia}" />
                                <input type="hidden" name="ID_Proveedor" value="${item.ID_Proveedor}" />
                                <input type="hidden" name="nombreProveedor" value="${item.nombreProveedor}" />
                                <input type="hidden" name="telefonoProveedor" value="${item.telefonoProveedor}" />
                                <button type="submit" class="btn btn-danger"><i class="fas fa-trash-alt"></i></button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="overlay" id="overlay"></div>
        <div class="popup-container" id="popup">
            <label>ID Producto: <span id="ID_Producto"></span></label><br>
            <label>Nombre Producto: <span id="nombreProducto"></span></label><br>
            <label>Descripcion: <span id="descripcion"></span></label><br>
            <label>Precio Unitario: <span id="precioUnitario"></span></label><br>
            <label>Existencia: <span id="existencia"></span></label><br>
            <label>ID Proveedor: <span id="ID_Proveedor"></span></label><br>
            <label>Nombre Proveedor: <span id="nombreProveedor"></span></label><br>
            <label>Telefono Proveedor: <span id="telefonoProveedor"></span></label><br>
            <button onclick="abrirPopup()" class="btn btn-secondary">Cerrar</button>
        </div>

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

                function mostrarDetallesProductos(ID_Producto, Nombre_Producto, Descripcion, Precio_Unitario, Existencia, ID_Proveedor, Nombre_Proveedor, Telefono_Proveedor) {
                    document.getElementById('ID_Producto').textContent = ID_Producto;
                    document.getElementById('nombreProducto').textContent = Nombre_Producto;
                    document.getElementById('descripcion').textContent = Descripcion;
                    document.getElementById('precioUnitario').textContent = Precio_Unitario;
                    document.getElementById('existencia').textContent = Existencia;
                    document.getElementById('ID_Proveedor').textContent = ID_Proveedor;
                    document.getElementById('nombreProveedor').textContent = Nombre_Proveedor;
                    document.getElementById('telefonoProveedor').textContent = Telefono_Proveedor;

                    // Muestra el pop-up
                    abrirPopup();
                }
        </script>
    </body>
</html>
