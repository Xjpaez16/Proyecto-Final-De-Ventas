<%-- 
    Document   : Principal
    Created on : 29/01/2025, 8:59:40 p. m.
    Author     : Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/estilospr.css">
        <title>Principal</title>
    </head>
    <body>
         <nav class="navi">
             <a href="Principal.jsp"><img src="img/logo.png" alt="Logo"/></a>
             <ul>
                 <li class="right"><a href="index.jsp">Salir</a></li>
             </ul>
        </nav>
        <script>
            window.onload = function() {
                document.getElementById("formEmpleado").submit();
            };
        </script>
        <div class="formventa">
            <form action="Controlador?menu=NuevaVenta" method="POST">    

                        <div class="ventan">
                            <button type="submit" name="accion" value="ventanueva" class="btnventa">
                                <img src="img/carrito.png" alt=""/>
                            </button>

                        </div>    


            </form>

            <form action="Controlador?menu=Empleado&accion=Listar" method="POST">    
                    <div class="formventa">
                        <div class="ventan">

                            <button type="submit" name="accion" value="Listar" class="btnventa">
                                <img src="img/user.webp" alt=""/>
                            </button>

                        </div>    
                    </div>


            </form>

            <form action="Controlador?menu=Cliente&accion=Listar" method="POST">    
                    <div class="formventa">
                        <div class="ventan">
                            <button type="submit" name="accion" value="Listar" class="btnventa">
                                <img src="img/clientes.png" alt=""/>
                            </button>
                        </div>    
                    </div>


            </form>
            
            <form action="Controlador?menu=Producto&accion=Listar" method="POST">    
                    <div class="formventa">
                        <div class="ventan">
                            <button type="submit" name="accion" value="Listar" class="btnventa">
                                <img src="img/productos.png" alt=""/>
                            </button>
                        </div>    
                    </div>


            </form>
        </div>

        <div class="textotbtn">
                    <h2>Nueva<br>Venta</h2>
                    <h2>Empleados</h2>
                    <h2>Clientes</h2>
                    <h2>Productos</h2>
        </div>
 
    </body>
    
</html>





